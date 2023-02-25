//
//  ContentView.swift
//  tic tac toe v3
//
//  Created by David Juarez on 1/13/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var appState:AppState
    @EnvironmentObject var scoreX:AppState
    @EnvironmentObject var scoreO:AppState
    //appState.inGame = false
    
    @State private var arr = Array(repeating: "space", count: 9)
    @State private var turn = "X"
    @State private var counter = 0
    
    
    
    func clicked(place:Int, rowNum:Int, colNum:Int, diagNum:Int = -1) {
        
        if (turn == "X") {
            arr[place] = "multiply"
            counter += 1
            if (counter == 9) {
                appState.winner = "No one"
                appState.inGame = false
            }
            
            turn = "O"
                        
        }
        else {
            arr[place] = "circle"
            counter += 1
            if (counter == 9) {
                appState.winner = "No one"
                appState.inGame = false
            }
            turn = "X"
        }
        
        if (diagNum != -1) {
            checkState(rowNum: rowNum, colNum: colNum, diagNum: diagNum)
        }
        else {
            checkState(rowNum: rowNum, colNum: colNum)
        }
    }
    
    func checkState (rowNum:Int, colNum:Int, diagNum:Int = -1) {
        let horizontal = isHorizontal(rowNum)
        let vert = isVert(colNum)
        let diag:Bool
        
        if (diagNum != -1) {
            diag = isDiag(diagNum)
        }
        else {
            diag = false
        }
        
        
        
        if (horizontal == true) {
            if turn == "O" {
                appState.scoreX += 1
            }
            else {
                appState.scoreO += 1
            }
            appState.inGame = false
        }
        else if (vert == true) {
            if turn == "O" {
                appState.scoreX += 1
            }
            else {
                appState.scoreO += 1
            }
            appState.inGame = false
        }
        else if (diag == true) {
            if turn == "O" {
                appState.scoreX += 1
            }
            else {
                appState.scoreO += 1
            }
            appState.inGame = false
        }
    }
    
    func isHorizontal(_ rowNum:Int) -> Bool {
        
        let row1 = [arr[0], arr[1], arr[2]]
        let row2 = [arr[3], arr[4], arr[5]]
        let row3 = [arr[6], arr[7], arr[8]]
        
        if (rowNum == 1) {
            //row1
            if row1.contains("space") {
                return false
            }
            else if row1.allSatisfy({$0 == "multiply"}) || row1.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        else if (rowNum == 2) {
            //row2
            if row2.contains("space") {
                return false
            }
            else if row2.allSatisfy({$0 == "multiply"}) || row2.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        else if (rowNum == 3) {
            //row3
            if row3.contains("space") {
                return false
            }
            else if row3.allSatisfy({$0 == "multiply"}) || row3.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        
        return false
    }
    
    func isVert (_ colNum:Int) -> Bool {
        
        let col1 = [arr[0], arr[3], arr[6]]
        let col2 = [arr[1], arr[4], arr[7]]
        let col3 = [arr[2], arr[5], arr[8]]
        
        
        if (colNum == 1) {
            //col 1
            if col1.contains("space") {
                return false
            }
            else if col1.allSatisfy({$0 == "multiply"}) || col1.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        else if (colNum == 2) {
            //col 2
            if col2.contains("space") {
                return false
            }
            else if col2.allSatisfy({$0 == "multiply"}) || col2.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        else if (colNum == 3) {
            //col 3
            if col3.contains("space") {
                return false
            }
            else if col3.allSatisfy({$0 == "multiply"}) || col3.allSatisfy({$0 == "circle"}){
                return true
            }
        }
        return false
    }
    
    func isDiag(_ diagNum:Int) -> Bool {
        
        let diag1 = [arr[0], arr[4], arr[8]]
        let diag2 = [arr[2], arr[4], arr[6]]
        
        if (diagNum == 1) {
            //diag 1
            if diag1.contains("space") {
                return false
            }
            else if diag1.allSatisfy({$0 == "multiply"}) || diag1.allSatisfy({$0 == "circle"}) {
                return true
            }
        }
        else if (diagNum == 2) {
            //diag 2
            if diag2.contains("space") {
                return false
            }
            else if diag2.allSatisfy({$0 == "multiply"}) || diag2.allSatisfy({$0 == "circle"}) {
                return true
            }
        }
        else if (diagNum == 3) {
            if (diag1.contains("space") || diag2.contains("space")) {
                return false
            }
            else if diag1.allSatisfy({$0 == "multiply"}) || diag1.allSatisfy({$0 == "circle"}) || diag2.allSatisfy({$0 == "multiply"}) || diag2.allSatisfy({$0 == "circle"}) {
                return true
            }
        }
        return false
    }
    
    
    var body: some View {
        
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding(.top, 15)
            Spacer()
            
            Text(turn + "'s turn")
                .font(.title)
                .padding(.bottom, 5)
            Spacer()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        if arr[0] == "space" {
                            clicked(place: 0, rowNum: 1, colNum: 1, diagNum: 1)
                        }
                    } label: {
                        Image(systemName: String(arr[0]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[1] == "space" {
                            clicked(place: 1, rowNum: 1, colNum: 2)
                        }
                    } label: {
                        Image(systemName: String(arr[1]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[2] == "space" {
                            clicked(place: 2, rowNum: 1, colNum: 3, diagNum: 2)
                        }
                    } label: {
                        Image(systemName: String(arr[2]))
                    }.padding(.all)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        if arr[3] == "space" {
                            clicked(place: 3, rowNum: 2, colNum: 1)
                        }
                    } label: {
                        Image(systemName: String(arr[3]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[4] == "space" {
                            clicked(place: 4, rowNum: 2, colNum: 2, diagNum: 3)
                        }
                    } label: {
                        Image(systemName: String(arr[4]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[5] == "space" {
                            clicked(place: 5, rowNum: 2, colNum: 3)
                        }
                    } label: {
                        Image(systemName: String(arr[5]))
                    }.padding(.all)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        if arr[6] == "space" {
                            clicked(place: 6, rowNum: 3, colNum: 1, diagNum: 2)
                        }
                    } label: {
                        Image(systemName: String(arr[6]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[7] == "space" {
                            clicked(place: 7, rowNum: 3, colNum: 2)
                        }
                    } label: {
                        Image(systemName: String(arr[7]))
                    }.padding(.all)
                    Spacer()
                    
                    Button {
                        if arr[8] == "space" {
                            clicked(place: 8, rowNum: 3, colNum: 3, diagNum: 1)
                        }
                    } label: {
                        Image(systemName: String(arr[8]))
                    }.padding(.all)
                    Spacer()
                }
                Spacer()
            }
            .font(.largeTitle)
            .foregroundColor(Color.black)
            
            HStack {
                Spacer()
                VStack (alignment: .center){
                    Text("X")
                        .font(.title)
                    Text("Score: " + String(appState.scoreX))
                        .font(.title2)
                }
                Spacer()
                VStack (alignment: .center) {
                    Text("O")
                        .font(.title)
                    Text("Score: " + String(appState.scoreO))
                        .font(.title2)
                }
                Spacer()
            }
                        
        }
        .task {
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView()
            
    }
}
