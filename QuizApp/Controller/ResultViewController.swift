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
  
    var storeData = StoreData()
    var resultScore: String?
    var animationView: AnimationView?
    var scoreList: [String] = []
    var resultScoreList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "confetti")
        animationView?.frame = CGRect(x: 0, y: 0, width: 470, height: 1100)
        view.addSubview(animationView!)
        animationView?.play()
        
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        resultScoreLabel.text = resultScore
        scoreList.append(resultScore!)
        
        self.storeData = StoreData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userDefaultsSaveData()
        self.userDefaultsLoadData()
    }
    
    func userDefaultsSaveData() {
        storeData.saveData(resultScore: scoreList, key: "new score")
    }
    func userDefaultsLoadData() {
       resultScoreList = storeData.loadData(key: "new score")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAchievement" {
            let achievementView = segue.destination as! AchievementViewController
            achievementView.resultScoreList = resultScoreList
        }
    }
}
    


