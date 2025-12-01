//
//  ContentView.swift
//  HotProspects
//
//  Created by Deepankar Das on 29/11/25.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct ContentView: View {
    let possibleNumbers = 1...60
   
    var result: String {
        let selected = possibleNumbers.random(7).sorted()
        let selectionString = selected.map(String.init)
        return selectionString.formatted()
    }
    
    var body: some View {
        VStack{
//            List{
//                Text("Taylor Swift")
//                    .swipeActions {
//                        Button{
//                            print("Hi")
//                        }label: {
//                            Image(systemName:"message" )
//                        }
//                        
//                    }
//                    .swipeActions(edge: .leading) {
//                        Button("Pin", systemImage: "pin") {
//                            print("Pinning")
//                        }
//                        .tint(.orange)
//                    }
//            }
            Text(result).padding()
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { success, error in
                    if success{
                        print("All set!")
                    }
                    else if let error {
                        print("Error: \(error)")
                    }
                }
            }

            Button("Schedule Notification") {
               let content = UNMutableNotificationContent()
                content.title = "Feed The Cat 🐱"
                content.subtitle = "Meow! Meow! Meow!..."
                content.sound = .default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { error in
                    if let error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
              
            }
        }
    }
}

#Preview {
    ContentView()
}
