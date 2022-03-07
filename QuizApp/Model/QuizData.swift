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
    
    /*
    let id: Int
    let question: String
    let quizQuestionDescription: String?
    let answers: Answers
    let multipleCorrectAnswers: String
    let correctAnswers: CorrectAnswers
    let correctAnswer: String
    let explanation: String?
   
    let tags: [Tag]
    let category, difficulty: String

    enum CodingKeys: String, CodingKey {
        case id, question
        case quizQuestionDescription = "description"
        case answers
        case multipleCorrectAnswers = "multiple_correct_answers"
        case correctAnswers = "correct_answers"
        case correctAnswer = "correct_answer"
        case explanation, tip, tags, category, difficulty
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
    struct Tag: Codable {
        let name: String
    }*/
}
