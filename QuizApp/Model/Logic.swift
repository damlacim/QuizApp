//
//  Logic.swift
//  QuizApp
//
//  Created by Damla Çim on 12.02.2022.
//

import Foundation

struct Logic {
    
    let quiz = [
        Questions(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Questions(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Questions(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Questions(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Questions(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Questions(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Questions(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Questions(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Questions(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Questions(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    func getQuestionText () -> String {
        return quiz[questionNumber].text
    }
    
    func getAnswer() -> [String] {
        return quiz[questionNumber].answer
    }
    
    func getProgress() -> Float {
        let progress = questionNumber / quiz.count
        return Float(progress)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion () {
        if self.questionNumber + 1 < quiz.count {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            score = 0
        }
    }
    

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
}
