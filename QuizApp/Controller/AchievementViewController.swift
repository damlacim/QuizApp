//
//  AchievementViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 20.03.2022.
//

import UIKit

class AchievementViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var table: UITableView!
    
    let data = UserDefaults.standard
    var scoreList: [String]?
    
    var dummyScore: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        data.set(scoreList, forKey: "new score") //score'u user defaults'a kaydettim.
        let scoreAchievementList = data.array(forKey: "new score") as? [Int] ?? [Int]() //score'ları arrayde tutucaz

        dummyScore = ["Score: 1","Score: 3","Score: 5", "Score: 0","Score: 6", "Score: 2","Score: 5"]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyScore.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = dummyScore[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    

  

}
