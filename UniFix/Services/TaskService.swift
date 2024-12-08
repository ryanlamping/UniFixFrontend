//
//  taskService.swift
//  UniFix
//
//  Created by Ryan Lamping on 12/1/24.
//

import Foundation
class TaskService {
    
    // Define route
    let apiURL = URL(string: "http://localhost:8000/services/type-services/")!
    
    func fetchTasks(completion: @escaping (Result<Data, Error>) -> Void) {
        // Setting up request
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        
        // Creating session
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error)) // Pass the error to the completion handler
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
                        
            completion(.success(data))
        }
        task.resume()
    }
}
