//
//  ComputedViewsDemoApp.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import SwiftUI

@main
struct ComputedViewsDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ProfileView()
                    .tabItem { Label("Computed", systemImage: "1.circle") }

                ExtractedProfileView()
                    .tabItem { Label("Extracted", systemImage: "2.circle") }

                WholeViewModelProfileView()
                    .tabItem { Label("Whole VM", systemImage: "3.circle") }

                ObservableProfileView()
                    .tabItem { Label("Observable", systemImage: "4.circle") }
            }
        }
    }
}
