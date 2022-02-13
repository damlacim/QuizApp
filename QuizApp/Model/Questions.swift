//
//  Questions.swift
//  QuizApp
//
//  Created by Damla Çim on 10.02.2022.
//

import Foundation

struct Questions {
    
    let text : String
    let answer : [String]
    let rightAnswer : String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
    
    
    
    
}
