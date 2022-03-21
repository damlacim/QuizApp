//
//  AchievementViewController.swift
//  QuizApp
//
//  Created by Damla Çim on 20.03.2022.
//

import UIKit

class AchievementViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dummyScore: [String] = [String]()
    var userDefaultData: StoreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //dummyScore = ["Score: 1","Score: 3","Score: 5", "Score: 0","Score: 6", "Score: 2","Score: 5"]
        self.userDefaultData = StoreData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = userDefaultData?.readData()
        return data!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        let data = userDefaultData?.readData()
        cell.textLabel?.text = data![indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    
}
