//
//  Logic.swift
//  QuizApp
//
//  Created by Damla Çim on 12.02.2022.
//

import Foundation
import UIKit

protocol LogicDelegate: AnyObject {
    func finishQuestions()
}

struct Logic {
    // MARK: Private Variables
    private(set) var quiz: [QuizData] = []
    private var questionNumber = 0
    private var score = 0
    
    weak var delegate: LogicDelegate?
    
    // MARK: Life Cycle
    init(data: [QuizData]) {
        self.quiz = data
    }
    
    // MARK: Methods
    func getQuestionText () -> String {
        return quiz[questionNumber].question
    }
    
    func getAnswer() -> Answers {
        return quiz[questionNumber].answers
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() -> QuizData {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            delegate?.finishQuestions()
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
        } else {
            return false
        }
    }
    
}
