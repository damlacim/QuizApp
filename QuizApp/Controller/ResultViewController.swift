//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 10.03.2022.
//

import UIKit
import Lottie

class ResultViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var resultScoreLabel: UILabel!
    // MARK: Variables
    var viewmodel = QuizViewModel()
    var resultScore: String?
    var animationView: AnimationView?
    var scoreList = [String]()
    var resultScoreList =  [String]()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        playAnimation()
        updateUI()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scoreList.append(resultScore!)
        self.userDefaultsSaveData()
        self.userDefaultsLoadData()
    }
    
    // MARK: Methods
    func setupAnimation() {
        animationView = .init(name: "confetti")
        animationView?.frame = CGRect(x: 0, y: 0, width: 470, height: 1100)
        view.addSubview(animationView!)
    }
    func playAnimation() {
        animationView?.play()
    }
    func updateUI() {
        self.navigationItem.hidesBackButton = true // back tuşunu gizledim soru cevaplama ekranına geri gidilmeyecek
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
            let achievementView = segue.destination as? AchievementViewController
            achievementView!.resultScoreList = resultScoreList
        }
    }
}
