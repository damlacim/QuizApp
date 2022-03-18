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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        
        resultScoreLabel.text = "Score: \(resultScore!)"
        
     /*   let score = UserDefaults.standard
        let scoreRecord = [logic?.getScore()]
        //veri kaydettik
        score.set(scoreRecord, forKey: "score list")
        
        //veri okuma
        let scoreList = score.array(forKey: "score list") as? [String] ?? [String]()
        
*/
        
    }
    

  

}
