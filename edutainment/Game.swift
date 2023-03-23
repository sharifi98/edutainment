//
//  Game.swift
//  edutainment
//
//  Created by Hossein Sharifi on 23/03/2023.
//

// Game.swift

// Game.swift

import Foundation

// The Game model holds the state and logic of the edutainment game.
class Game {
    var maxMultiplicationNumber: Int
    var selectedQuestionNumber: Int
    var score: Int
    var round: Int
    
    init(maxMultiplicationNumber: Int = 2, selectedQuestionNumber: Int = 5) {
        self.maxMultiplicationNumber = maxMultiplicationNumber
        self.selectedQuestionNumber = selectedQuestionNumber
        self.score = 0
        self.round = 0
    }
    
    // This function checks whether the game has reached the maximum number of questions.
    func isGameFinished() -> Bool {
        return round >= selectedQuestionNumber
    }
    
    // This function increases the round count.
    func incrementRound() {
        round += 1
    }
    
    // This function increases the score by the given value.
    func incrementScore(by value: Int) {
        score += value
    }
}
