//
//  ExtractedProfileView.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import SwiftUI

/// The fix. `SettingsSection` is a real view that gets only the binding it needs
/// and owns its own presentation state.
///
/// Type in Name. `ExtractedProfileView` prints, but "settings part rebuilt" never appears,
/// and neither `SettingsSection` nor `StatusRow` print anything.
/// Tap "What is this?". Only `SettingsSection` should print.
struct ExtractedProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        let _ = Self._printChanges()

        Form {
            TextField("Name", text: $viewModel.name)

            SettingsSection(notificationsOn: $viewModel.notificationsOn)

            StatusRow(notificationsOn: viewModel.notificationsOn)
        }
    }
}

struct SettingsSection: View {
    @Binding var notificationsOn: Bool
    @State private var showHelp = false

    var body: some View {
        let _ = Self._printChanges()
        let _ = print("settings part rebuilt")

        Toggle("Notifications", isOn: $notificationsOn)

        Button("What is this?") {
            showHelp = true
        }
        .sheet(isPresented: $showHelp) {
            Text("We only send important updates.")
        }
    }
}

/// Takes a plain value instead of a binding, for comparison with `SettingsSection`.
struct StatusRow: View {
    let notificationsOn: Bool

    var body: some View {
        let _ = Self._printChanges()

        LabeledContent("Status", value: notificationsOn ? "On" : "Off")
    }
}

#Preview {
    Form {
        SettingsSection(notificationsOn: .constant(true))
    }
}
