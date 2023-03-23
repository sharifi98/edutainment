//
//  GameController.swift
//  edutainment
//
//  Created by Hossein Sharifi on 23/03/2023.
//

import Foundation

// GameController is the controller that manages the communication between the Game model and the GameView.
class GameController: ObservableObject {
    @Published var game: Game
    let numberOfQuestions = [5, 10, 15, 20]
    
    init(game: Game) {
        self.game = game
    }
    
    func newQuestion(completion: (_ multTable: Int, _ number: Int) -> Void) {
        if !game.isGameFinished() {
            let multTable = Int.random(in: 2...game.maxMultiplicationNumber)
            let number = Int.random(in: 2...game.maxMultiplicationNumber)
            game.incrementRound()
            completion(multTable, number)
        } else {
            completion(-1, -1)
        }
    }
    
    func checkAnswer(_ answer: String, multTable: Int, number: Int) -> Bool {
        let correctAnswer = multTable * number
        if let userAnswer = Int(answer), userAnswer == correctAnswer {
            game.incrementScore(by: multTable)
            return true
        } else {
            return false
        }
    }
}
