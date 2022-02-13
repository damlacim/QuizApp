//
//  ViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 9.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonC1: UIButton!
    @IBOutlet weak var buttonC2: UIButton!
    @IBOutlet weak var buttonC3: UIButton!
    
   var quizLogic = Logic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        guard let userAnswer = sender.currentTitle else {
            return
        }
        
        let userGotItRight = quizLogic.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizLogic.getQuestionText()
        let answerChoices = quizLogic.getAnswer()
        buttonC1.setTitle(answerChoices[0], for: .normal)
        buttonC2.setTitle(answerChoices[1], for: .normal)
        buttonC3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizLogic.getProgress()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        
        buttonC1.backgroundColor = UIColor.clear
        buttonC2.backgroundColor = UIColor.clear
        buttonC3.backgroundColor = UIColor.clear
        
        
    }

}

