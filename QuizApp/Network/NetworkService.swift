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
 ResponseError = Error
 
 
 1 - Request
 * URL
 * Response Type (T)
 2 - Maping
 3 - Responsse (T?, Response?)
 */
final class NetworkService {
    
    // MARK: Enum
    
    enum ResponseError: Error {
        case unauthenticated
        case noQuestionsFound
        case unknown
        case decodingError(Error)
    }
    
    typealias CompletionHandler = ((Decodable?, ResponseError?) -> Void)
    
    // MARK: Methods
    
    func callApi<T>(url: URL,
                    object: T.Type,
                    handler: @escaping CompletionHandler) where T: Decodable {
        // Create a URLSession
        let session = URLSession(configuration: .default)
        // Give URLSession a task
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                handler(nil, .decodingError(error))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    if let safeData = data {
                        self.parseJSON(object: object, data: safeData, handler: handler)
                    }
                case 401:
                    handler(nil, .unauthenticated)
                default:
                    handler(nil, .unknown)
                }
            }
        }
        // Start the task
        task.resume()
    }
    
    func parseJSON<T>(object: T.Type,
                      data: Data,
                      handler: @escaping CompletionHandler) where T: Decodable {
        // json verilerini ayrıştırcaz
        
        do {
            let baseResponse = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                handler(baseResponse, nil)
            }
            
        } catch (let error) {
            // hata verirse yakalarız
            DispatchQueue.main.async {
                handler(nil, .decodingError(error))
            }
        }
    }
    
}
