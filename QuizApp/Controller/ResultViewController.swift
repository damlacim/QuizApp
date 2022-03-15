//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 10.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    var logic: Logic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let score = logic?.getScore()
        resultScoreLabel.text = "Score: \(String(describing: score))" //nil geliyor
    }
    

  

}
