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
  
    var viewmodel = QuizViewModel()
    var resultScore: String?
    var animationView: AnimationView?
    var scoreList: [String] = []
    var resultScoreList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupAnimastion()
        playAnimation()
        updateUI()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scoreList.append(resultScore!)
        self.userDefaultsSaveData()
        self.userDefaultsLoadData()
    }
    func setupAnimastion() {
        animationView = .init(name: "confetti")
        animationView?.frame = CGRect(x: 0, y: 0, width: 470, height: 1100)
        view.addSubview(animationView!)
    }
    func playAnimation() {
        animationView?.play()
    }
    
    func updateUI() {
        self.navigationItem.hidesBackButton = true //back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
        resultScoreLabel.text = resultScore
    }
    
    func userDefaultsSaveData() {
        viewmodel.saveData(resultScore: scoreList, key: "new score")
    }
    func userDefaultsLoadData() {
       resultScoreList = viewmodel.loadData(key: "new score")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAchievement" {
            let achievementView = segue.destination as! AchievementViewController
            achievementView.resultScoreList = resultScoreList
        }
    }
}
    


