//
//  QuizManager.swift
//  QuizApp
//
//  Created by Damla Çim on 5.03.2022.
//

import Foundation


/* Error Handler (Enum)
 ResonseError {
    NetworkError
    ApiError
    JsonCoding
    Unknown
 }
 
 QuizData = <T>
 ResonseError = Error
    

 1 - Request
    * URL
    * Response Type (T)
 2 - Maping
 3 - Responsse (T?, Response?)
 */



final class APINetwork {

    typealias CompletionHandler = ((Decodable?, Error?) -> Void)
    
    func callApi<T>(url: URL,
                    object: T.Type,
                    handler: @escaping CompletionHandler) where T: Decodable {
        
        let session = URLSession(configuration: .default)
        //Give URLSession a task
        let task = session.dataTask(with: url) { [self] data, response, error in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                parseJSON(object: object,
                          data: safeData,
                          handler: handler)
            }
        }
        //Start the task
        task.resume()
    }
    
    func parseJSON<T>(object: T.Type,
                      data: Data,
                      handler: CompletionHandler) where T: Decodable {
            //json verilerini ayrıştırcaz
        
            do {
                let baseResponse = try JSONDecoder().decode(T.self, from: data)
               handler(baseResponse, nil)
            } catch (let error) {
                //hata verirse yakalarız
                handler(nil, error)
            }
        }
    
  
    
}
