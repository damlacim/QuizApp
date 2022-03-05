//
//  QuizManager.swift
//  QuizApp
//
//  Created by Damla Çim on 5.03.2022.
//

import Foundation

struct QuizManager {
    
    let quizURL = "https://quizapi.io/api/v1/questions?apiKey=PgtZ92pOzQjokad7tqq89vwsisdqoxpjgHBugbnR&category=bash&limit=10"
    
    func fetchQuiz() {
        let urlString = quizURL
        performRequest(urlString: urlString )
    }
    
    func performRequest(urlString: String) {
        //Create a URL
        if let url = URL(string: urlString) {
            //Create a URLSession
            let session = URLSession(configuration: .default)
            //Give URLSession a task
            let task = session.dataTask(with: url, completionHandler: handle(data:urlResponse:error:))
            
            //Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
        }
    }
    
    
    
}
