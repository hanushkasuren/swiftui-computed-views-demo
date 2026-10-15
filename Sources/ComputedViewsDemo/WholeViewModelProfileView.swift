//
//  WholeViewModelProfileView.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import SwiftUI

/// The halfway step. `NameSection` is a separate struct but observes the whole view model.
/// Flip Notifications and `NameSection` prints too, even though it only shows the name.
struct WholeViewModelProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        Form {
            NameSection(viewModel: viewModel)

            Toggle("Notifications", isOn: $viewModel.notificationsOn)
        }
    }
}

struct NameSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        let _ = Self._printChanges()

        TextField("Name", text: $viewModel.name)
    }
}

#Preview {
    WholeViewModelProfileView()
}
