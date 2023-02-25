//
//  tic_tac_toe_v3App.swift
//  tic tac toe v3
//
//  Created by David Juarez on 1/13/23.
//

import SwiftUI

class AppState:ObservableObject {

    @Published var inGame: Bool
    @Published var winner: String
    @Published var scoreX: Int
    @Published var scoreO: Int
    init(inGame: Bool, winner: String, scoreX: Int, scoreO: Int) {
        self.inGame = inGame
        self.winner = winner
        self.scoreX = scoreX
        self.scoreO = scoreO
    }
//    @Published var hasOnboarded: Bool
//    init (hasOnboarded: Bool) {
//    self.hasOnboarded = hasOnboarded
//
//    }
}


@main
struct tic_tac_toe_v3App: App {
    
    @ObservedObject var appState = AppState(inGame: true, winner: "X", scoreX: 0, scoreO: 0)
    
    var body: some Scene {
        WindowGroup {
            
            if appState.inGame {
                GameView()
                    .environmentObject(appState)
            }
            else {
                WinnerView()
                    .environmentObject(appState)
            }
            
        }
        
    }
}
