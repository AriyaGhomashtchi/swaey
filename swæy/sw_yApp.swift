//
//  sw_yApp.swift
//  swæy
//
//  Created by Ariya Ghomashtchi on 21.06.23.
//

import SwiftUI
import Firebase
@main
struct sw_yApp: App {
    @StateObject private var viewModel: SwaeyViewModel = SwaeyViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
