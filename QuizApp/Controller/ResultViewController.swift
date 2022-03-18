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
    let resultScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        
     /*   let score = UserDefaults.standard
        let scoreRecord = [logic?.getScore()]
        //veri kaydettik
        score.set(scoreRecord, forKey: "score list")
        
        //veri okuma
        let scoreList = score.array(forKey: "score list") as? [String] ?? [String]()
        
*/
        
    }
    

  

}
