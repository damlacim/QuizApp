//
//  Logic.swift
//  QuizApp
//
//  Created by Damla Çim on 12.02.2022.
//

import Foundation

struct Logic {
    
    private(set) var quiz: [QuizData] = []
    
    private var questionNumber = 0
    private var score = 0
    
    init(data: [QuizData]) {
        self.quiz = data
    }
    
    func getQuestionText () -> String {
        return quiz[questionNumber].question
    }
    
    func getAnswer() -> Answers {
        return quiz[questionNumber].answers
    }
    
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion () -> QuizData {
        if self.questionNumber + 1 < quiz.count {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            score = 0
        }
        
        return quiz[questionNumber]
    }
    
    mutating func checkAnswer(_ userSelectedIndex: Int) -> Bool {
        let model = quiz[questionNumber]
        let answers = Mirror(reflecting: model.answers.self)
        let answerString =  answers.children.compactMap({$0.label})[userSelectedIndex]
        
        if answerString.lowercased() == model.correctAnswer!.replacingOccurrences(of: "_", with: "").lowercased() {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
}
