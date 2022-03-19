//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 10.03.2022.
//

import UIKit
import Lottie

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    var logic: Logic?
    var resultScore: Int?
    let data = UserDefaults.standard
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "confetti")
        animationView?.frame = CGRect(x: 0, y: 0, width: 470, height: 1100)
        view.addSubview(animationView!)
        animationView?.play()
        
        
        
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        resultScoreLabel.text = "Score: \(resultScore!)"
        
        data.set(resultScore, forKey: "new score") //score'u user defaults'a kaydettim.
        let scoreList = data.array(forKey: "new score") as? [Int] ?? [Int]() //score'ları arrayde tutucaz
        
        
    }
    

  

}
