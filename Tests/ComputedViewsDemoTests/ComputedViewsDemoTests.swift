//
//  ComputedViewsDemoTests.swift
//  ComputedViewsDemoTests
//
//  Created by Hanushka Suren on 14/10/2026.
//

import Combine
import Observation
import Testing
@testable import ComputedViewsDemo

/// A small reference box so the `@Sendable` change handlers can record what happened.
final class Counter: @unchecked Sendable {
    var value = 0
}

struct ComputedViewsDemoTests {
    @Test func anyPublishedChangeNotifiesEveryObserver() {
        // Given
        let viewModel = ProfileViewModel()
        let counter = Counter()
        let cancellable = viewModel.objectWillChange.sink { counter.value += 1 }

        // When
        viewModel.notificationsOn = true

        // Then
        #expect(counter.value == 1)
        cancellable.cancel()
    }

    @Test func observationIgnoresPropertiesThatWereNotRead() {
        // Given
        let profile = Profile()
        let counter = Counter()
        withObservationTracking {
            _ = profile.name
        } onChange: {
            counter.value += 1
        }

        // When
        profile.notificationsOn = true

        // Then
        #expect(counter.value == 0)
    }

    @Test func observationNotifiesWhenAReadPropertyChanges() {
        // Given
        let profile = Profile()
        let counter = Counter()
        withObservationTracking {
            _ = profile.name
        } onChange: {
            counter.value += 1
        }

        // When
        profile.name = "keyboard"

        // Then
        #expect(counter.value == 1)
    }
}
