//
//  WatchTaskApp.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

@main
struct WatchTaskApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
