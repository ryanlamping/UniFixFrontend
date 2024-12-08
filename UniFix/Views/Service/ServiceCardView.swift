//
//  ServiceCardView.swift
//  UniFix
//
//  Created by Ryan Lamping on 12/8/24.
//

import SwiftUI

struct ServiceCardView: View {
    let serviceName: String
    let imageID: Int
    
    var body: some View {
        // Navigation Link with destination of contractorlistview(serviceID: serviceID))
        HStack(spacing: 10) {
            Image("\(imageID)")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(serviceName)
                .font(.body)
                .foregroundColor(.black)
                .bold()
        }
        .padding()
        .frame(width: 250, height: 150)
        .background(Color(hex: "#cca300"))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

