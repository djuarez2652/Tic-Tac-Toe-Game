//
//  EndView.swift
//  tic tac toe v3
//
//  Created by David Juarez on 1/13/23.
//

import SwiftUI

struct WinnerView: View {
    
    @EnvironmentObject var appState:AppState
    
    var body: some View {
        
        
        
        VStack {
            
            Text(appState.winner + " Won.")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("X has " + String(appState.scoreX) + " wins")
                .padding([.top, .bottom], 20)
            Text("O has " + String(appState.scoreO) + " wins")
                .padding([.top, .bottom], 20)
            
            
            Button {
                appState.inGame = true
            } label: {
                Image(systemName: "arrow.clockwise")
                Text("Restart?")
                

            }.font(.title)
                .foregroundColor(Color.red)
                .padding(.top, 20)
        }

    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView()
    }
}
