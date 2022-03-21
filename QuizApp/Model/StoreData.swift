//
//  StoreData.swift
//  QuizApp
//
//  Created by Damla Çim on 21.03.2022.
//

import Foundation

class StoreData {
    
    let defaults = UserDefaults.standard
    
    func setDefaults(resultScore: String) {
        defaults.set(resultScore, forKey: "new score")
    }
    
    func readData() -> [String] {
        let scoreList = defaults.array(forKey: "new score") as? [String] ?? [String]()
        return scoreList
    }
}
