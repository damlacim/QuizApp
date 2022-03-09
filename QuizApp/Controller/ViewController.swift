//
//  ViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 9.02.2022.
//

import UIKit
// class = referance type
// struct = value type
class ViewController: UIViewController { // 1
    
    //MARK: IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonC1: UIButton!
    @IBOutlet weak var buttonC2: UIButton!
    @IBOutlet weak var buttonC3: UIButton!
    
    //MARK: Private Variables
    private let api = APINetwork()
    private var logic: Logic? = nil
    
    //MARK: Global Variables
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=bash&limit=10")!
        
        api.callApi(url: url,
                    object: [QuizData].self) { [weak self] model, error in
            
            self?.logic = Logic(data: model as! [QuizData]) //2
            self?.nextQuestion()
        }
        
    }
    
    //MARK: Methods
    private func nextQuestion() {
        bindUI()
    }
    
    private func bindUI() {
        let model = logic?.nextQuestion()
        questionLabel.text = model?.question
    }
    
    //MARK: IBActions
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
    }
    
}

