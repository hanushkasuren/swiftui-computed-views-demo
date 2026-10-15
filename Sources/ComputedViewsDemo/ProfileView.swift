//
//  ProfileView.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import SwiftUI

/// The problem. Both parts are computed properties, so SwiftUI only sees `ProfileView`.
/// Type in Name and the console prints a `ProfileView` line on every keystroke,
/// followed by "settings part rebuilt", even though the toggle has nothing to do with the name.
struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        let _ = Self._printChanges()

        Form {
            nameSection
            settingsSection
        }
    }

    var nameSection: some View {
        TextField("Name", text: $viewModel.name)
    }

    @ViewBuilder
    var settingsSection: some View {
        let _ = print("settings part rebuilt")

        Toggle("Notifications", isOn: $viewModel.notificationsOn)
    }
}

#Preview {
    ProfileView()
}
