//
//  ServiceResponse.swift
//  UniFix
//
//  Created by Ryan Lamping on 12/1/24.
//

import Foundation

 struct ServiceResponse: Codable {
    // fit json response: dictionary -- key is the type, value is the list of services
    let data: [String: [Service]]
 }

struct Service: Identifiable, Codable {
    let id: Int
    let name: String
}

struct ServiceCategory {
    let categoryName: String
    let services: [Service]
}
