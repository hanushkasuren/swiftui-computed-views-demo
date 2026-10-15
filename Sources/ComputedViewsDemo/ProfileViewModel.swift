//
//  ProfileViewModel.swift
//  ComputedViewsDemo
//
//  Created by Hanushka Suren on 14/10/2026.
//

import Combine

final class ProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var notificationsOn = false
}
