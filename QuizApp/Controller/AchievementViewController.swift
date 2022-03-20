//
//  AchievementViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 20.03.2022.
//

import UIKit

class AchievementViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let data = UserDefaults.standard
    var scoreList: [Int]?

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.set(scoreList, forKey: "new score") //score'u user defaults'a kaydettim.
        let scoreAchievementList = data.array(forKey: "new score") as? [Int] ?? [Int]() //score'ları arrayde tutucaz

        
    }
    
    

  

}
