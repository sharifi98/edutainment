//
//  GameView.swift
//  edutainment
//
//  Created by Hossein Sharifi on 23/03/2023.
//

import SwiftUI

// GameView is the SwiftUI view that displays the edutainment game.
struct GameView: View {
    @ObservedObject var gameController: GameController
    
    // UI state
    @State private var multTable: Int = Int.random(in: 2...12)
    @State private var number: Int = Int.random(in: 2...12)
    @State private var userInput = ""
    @State private var questions = ""
    @State private var text = ""
    @State private var results = [String]()
    @FocusState private var isFocused: Bool
    
    // The body of the view.
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Edutainment")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Multiplication Practice")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.top)
                
                Form {
                    Stepper("Multiplication up to \(gameController.game.maxMultiplicationNumber)", value: $gameController.game.maxMultiplicationNumber, in: 2...12)
                    
                    Section(header: Text("How many questions?")) {
                        Picker("Number of questions", selection: $gameController.game.selectedQuestionNumber) {
                            ForEach(gameController.numberOfQuestions, id: \.self) { question in
                                Text("\(question)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                Text("Questions number: \(gameController.game.round)")
                
                Text("Score: \(gameController.game.score)")
                    .font(.title)
                
                Text(questions)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                TextField("User input", text: $userInput)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .focused($isFocused)
                
                Text("\(text)")
                    .foregroundColor(text == "Correct" ? .green : .red)
                
                List {
                    ForEach(results, id: \.self) { resu in
                        Text(resu)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("New question", action: newQuestion)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                        result()
                    }
                }
            }
        }
    }
    
    func newQuestion() {
        gameController.newQuestion { newMultTable, newNumber in
            multTable = newMultTable
            number = newNumber
            userInput = ""
            text = ""
            questions = "\(multTable) * \(number)"
        }
    }
    
    func result() {
        let correct = gameController.checkAnswer(userInput, multTable: multTable, number: number)
        text = correct ? "Correct" : "Wrong"
        if correct {
            results.insert("\(multTable) * \(number) = \(multTable * number)", at: 0)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameController: GameController(game: Game()))
    }
}
