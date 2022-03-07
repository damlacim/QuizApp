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
    
    
    private let api = APINetwork()
    
 //"https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=bash&limit=10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        updateUI()
        
        let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=bash&limit=10")!
        
        api.callApi(url: url,
                    object: [QuizData].self) { model, error in
            
            
            
        }
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
       
        
    }
    
    @objc func updateUI() {
        
        
        
    }

}

