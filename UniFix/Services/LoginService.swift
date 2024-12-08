//
//  LoginService.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/24/24.
//

import Foundation

class LoginService {
    // Define route
    let apiURL = URL(string: "http://127.0.0.1:8000/auth/login")!
    
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
            var request = URLRequest(url: apiURL)
            
            let jsonBody: [String: String] = [
                "email": email,
                "password": password
            ]
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody) else {
                print("Failed to encode JSON body")
                return
            }
            
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                       print("Status Code: \(httpResponse.statusCode)")
                }

                if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                        print("Response JSON: \(jsonString)")
                }
                
                if let data = data {
                    do {
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let accessToken = jsonResponse["access_token"] as? String {
                            
                            do {
                                try KeychainManager.instance.saveToken(accessToken, forKey: "jwtAccessToken")
                                completion(.success(accessToken))
                            } catch {
                                print("failed saving token")
                                completion(.failure(error))
                            }
                        } else {
                            let error = NSError(domain: "LoginService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Access token not found in response"])
                            completion(.failure(error))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
}
