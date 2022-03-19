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
    var resultScore: Int?
    let data = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        resultScoreLabel.text = "Score: \(resultScore!)"
        
        data.set(resultScore, forKey: "new score") //score'u user defaults'a kaydettim.
        let scoreList = data.array(forKey: "new score") as? [Int] ?? [Int]() //score'ları arrayde tutucaz
        
        
    }
    

  

}
