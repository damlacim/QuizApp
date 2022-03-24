//
//  StoreData.swift
//  QuizApp
//
//  Created by Damla Çim on 21.03.2022.
//

import Foundation

class StoreData {
    
    let defaults = UserDefaults.standard
    
    func saveData(resultScore: [String], key: String) {
        defaults.set(resultScore, forKey: key)
    }
    
    func loadData(key: String) -> [String] {
        let scoreList = defaults.array(forKey: key) as? [String] ?? [String]()
        return scoreList
    }
}
