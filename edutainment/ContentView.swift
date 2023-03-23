//
//  ContentView.swift
//  edutainment
//
//  Created by Hossein Sharifi on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GameView(gameController: GameController(game: Game()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
