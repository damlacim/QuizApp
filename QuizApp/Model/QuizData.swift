//
//  QuizData.swift
//  QuizApp
//
//  Created by Damla Çim on 7.03.2022.
//

import Foundation
//struct conforms to the Decodable protocol and that means that the QuizData turned into a type that can decode itself from an external representation namely the JSON representation

struct QuizData: Codable {
    
    let id: Int
    let question: String
    let answers: Answers
    let correctAnswers: CorrectAnswers
    let correctAnswer: String?
    
 
    enum CodingKeys: String, CodingKey {
        case id, question
        case answers
        case correctAnswers = "correct_answers" // 2 true
        case correctAnswer = "correct_answer"//2
    }
 
}

struct Answers: Codable {
        let answerA, answerB, answerC, answerD: String
        let answerE, answerF: String?
        
        enum CodingKeys: String, CodingKey {
            case answerA = "answer_a"
            case answerB = "answer_b"
            case answerC = "answer_c"
            case answerD = "answer_d"
            case answerE = "answer_e"
            case answerF = "answer_f"
        }
}

struct CorrectAnswers: Codable {
        let answerACorrect, answerBCorrect, answerCCorrect, answerDCorrect: String
        let answerECorrect, answerFCorrect: String
        
        enum CodingKeys: String, CodingKey {
            case answerACorrect = "answer_a_correct"
            case answerBCorrect = "answer_b_correct"
            case answerCCorrect = "answer_c_correct"
            case answerDCorrect = "answer_d_correct"
            case answerECorrect = "answer_e_correct"
            case answerFCorrect = "answer_f_correct"
        }
}
