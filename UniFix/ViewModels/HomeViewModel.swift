//
//  HomeViewModel.swift
//  UniFix
//
//  Created by Ryan Lamping on 12/1/24.
//

import Foundation

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var serviceCategories: [ServiceCategory] = []
    @Published var errorMessage: String? = nil
    
    private var taskService = TaskService()
    
    func fetchServiceData() {
        taskService.fetchTasks { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        // Decode the response
                        let response = try JSONDecoder().decode(ServiceResponse.self, from: data)
                        
                        // Map the response to your ServiceCategory array
                        self.serviceCategories = response.data.map { (key, services) in
                            ServiceCategory(categoryName: key, services: services)
                        }
                    } catch {
                        self.errorMessage = "Decoding error: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
