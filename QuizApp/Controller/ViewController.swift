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
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //MARK: Private Variables
    private let api = NetworkService()
    private var logic: Logic?
    private var counter = 30
     var timer: Timer?
    
    
    
    //MARK: Global Variables
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=linux&difficulty=Easy&limit=10")!
        
        api.callApi(url: url,
                    object: [QuizData].self) { [weak self] model, error in
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
            
            self.logic = Logic(data:array)
            self.bindUI()
            self.logic?.delegate = self
            
           
        }
        self.startTimer()
        
    }
    
    //MARK: Methods
    @objc private func bindUI() {
        let model = logic?.nextQuestion()
        questionLabel.text = model?.question
        updateButton()
        scoreLabel.text = "Score: \(logic!.getScore())"
        clearBackground()
        updateTimer()
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
    
    func startTimer() {
        timer =  Timer.scheduledTimer(
            timeInterval: TimeInterval(1.0),
            target      : self,
            selector    : #selector(self.updateTimer),
            userInfo    : nil,
            repeats     : true)
    }
    
    @objc func updateTimer() {
        
        if counter > 0 {
            counter -= 1
            timerLabel?.text = "Time:\(counter)"
        }
        else {
            timer?.invalidate()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func goToResultPage() { //result sayfası için yönlendirme
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //hangi storyboardda olduğumu belirttim
        //gidilecek view controller
        let goToResult = storyboard.instantiateViewController(withIdentifier: "resultViewControllerID") as! ResultViewController
        let score = self.scoreLabel.text //gönderilecek veriyi aldım
        goToResult.resultScore = score //verinin gideceği sınıftan nesne oluşturdum ve veriyi atadım
        self.navigationController?.pushViewController(goToResult, animated: true) //yönlendirme yaptım
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
    
}

extension ViewController: LogicDelegate {
    func finishQuestions() {
        goToResultPage()
    }
    
}

