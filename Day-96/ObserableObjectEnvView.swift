//
//  ObserableObjectEnvView.swift
//  SnowSeeker
//
//  Created by Deepankar Das on 26/12/25.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    var body: some View {
        @Bindable var player = player
        Stepper("High Score: \(player.highScore)", value: $player.highScore)
    }
}
struct ObserableObjectEnvView: View {
    @State private var player = Player()
    var body: some View {
        VStack{
            Text("Welcome Player!")
            HighScoreView()
        }.environment(player)
    }
}

#Preview {
    ObserableObjectEnvView()
}
