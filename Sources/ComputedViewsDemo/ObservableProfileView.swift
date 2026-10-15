//
//  ObservableProfileView.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import SwiftUI

/// @Observable tracks reads per body, but only at real view boundaries.
///
/// Type in Name (a real view). Only `NameField` should print.
/// Type in Nickname (a computed property). `ObservableProfileView` prints.
struct ObservableProfileView: View {
    @State private var profile = Profile()

    var body: some View {
        let _ = Self._printChanges()

        Form {
            NameField(profile: profile)

            nicknameField
        }
    }

    var nicknameField: some View {
        TextField("Nickname", text: $profile.nickname)
    }
}

struct NameField: View {
    @Bindable var profile: Profile

    var body: some View {
        let _ = Self._printChanges()

        TextField("Name", text: $profile.name)
    }
}

#Preview {
    ObservableProfileView()
}
