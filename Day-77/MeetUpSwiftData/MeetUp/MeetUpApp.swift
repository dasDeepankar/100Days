//
//  MeetUpApp.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import SwiftUI
import SwiftData
@main
struct MeetUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: User.self)
    }
}
