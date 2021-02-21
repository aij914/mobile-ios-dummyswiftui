//
//  dummy_swiftuiApp.swift
//  dummy_swiftui
//
//  Created by Kiu Ai on 1/12/21.
//

import SwiftUI

@main
struct dummy_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
