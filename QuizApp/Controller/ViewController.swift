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
    @IBOutlet weak var buttonC1: UIButton!
    @IBOutlet weak var buttonC2: UIButton!
    @IBOutlet weak var buttonC3: UIButton!
    @IBOutlet weak var buttonC4: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    //MARK: Private Variables
    private let api = APINetwork()
    private var logic: Logic? = nil
    
    //MARK: Global Variables
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=linux&limit=10")!
        
        api.callApi(url: url,
                    object: [QuizData].self) { [weak self] model, error in
            let array =  (model as! [QuizData]).filter({$0.correctAnswer != nil})
            
            self?.logic = Logic(data:array) //2
            self?.nextQuestion()
        }
        
    }
    
    //MARK: Methods
    private func nextQuestion() {
        bindUI()
    }
    
    @objc private func bindUI() {
        let model = logic?.nextQuestion()
        questionLabel.text = model?.question
        updateButton()
        scoreLabel.text = "Score: \(logic!.getScore())"
        clearBackground()
        
    }
    
    private func updateButton() {
        let answerChoices = logic?.getAnswer()
        buttonC1.setTitle(answerChoices?.answerA, for: .normal)
        buttonC2.setTitle(answerChoices?.answerB, for: .normal)
        buttonC3.setTitle(answerChoices?.answerC, for: .normal)
        buttonC4.setTitle(answerChoices?.answerD, for: .normal)
      
    }
    
    private func clearBackground() {
        buttonC1.backgroundColor = UIColor.clear
        buttonC2.backgroundColor = UIColor.clear
        buttonC3.backgroundColor = UIColor.clear
        buttonC4.backgroundColor = UIColor.clear
        
    }
    
    //MARK: IBActions
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userGotItRight = logic!.checkAnswer(sender.tag)
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(bindUI), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
}

