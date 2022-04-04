//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Damla Çim on 1.04.2022.
//

import Foundation
import UIKit

protocol QuizViewModelDelegate: AnyObject {
    func fetched()
}

class QuizViewModel {

    var logic: Logic?
    let api = NetworkService()
    weak var delegate: QuizViewModelDelegate?
    let defaults = UserDefaults.standard
    
    
    func networkService() {
        
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=linux&difficulty=Easy&limit=10")!
        
        api.callApi(url: url, object: [QuizData].self) { [weak self] model, error in
            
            guard let self = self else {
                return
            }
            var array: [QuizData]
            if model == nil {
                array = Bundle.main.decode([QuizData].self, from: "DataFile")
                return
            } else {
                 array =  (model as! [QuizData]).filter({$0.correctAnswer != nil})
            }
            self.logic = Logic(data: array)
            self.logic?.delegate = self
        }
        
    }
    
    func getQuestionText() -> String? {
        return logic?.getQuestionText()
    }
    
    func getAnswer() -> Answers? {
        return logic?.getAnswer()
    }
    
    func getScore() -> Int {
        return (logic?.getScore())!
    }
    
    func nextQuestion() -> QuizData? {
        return logic?.nextQuestion()
    }
    
    func checkAnswer(_ userSelectedIndex: Int) -> Bool? {
        return logic?.checkAnswer(userSelectedIndex)
    }
    
    func saveData(resultScore: [String], key: String) {
        defaults.set(resultScore, forKey: key)
    }
    
    func loadData(key: String) -> [String] {
        let scoreList = defaults.array(forKey: key) as? [String] ?? [String]()
        return scoreList
    }
    
}
extension QuizViewModel: LogicDelegate {
    func finishQuestions() {
        delegate?.fetched()
    }
}



    
    

