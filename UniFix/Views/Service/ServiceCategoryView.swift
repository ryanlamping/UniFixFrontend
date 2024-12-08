//
//  ServiceCategoryView.swift
//  UniFix
//
//  Created by Ryan Lamping on 12/8/24.
//

import SwiftUI

struct ServiceCategoryView: View {
    let category: ServiceCategory
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.categoryName)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(category.services) { service in
                        ServiceCardView(serviceName: service.name, imageID: service.id)
                    }
                }
            }
        }
        .padding()
    }
}
