//
//  HomeView.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/24/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    // View encapsulated
    var body: some View {
        VStack {
            titleSection
            categoriesSection
        }
        .padding(.top, 50)
        .applyBackground()
    }

    // Title
    private var titleSection: some View {
        Text("Request a Service")
            .foregroundColor(.white)
            .font(.title)
            .padding()
    }

    // Categories
    private var categoriesSection: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ForEach(viewModel.serviceCategories, id: \.categoryName) { category in
                            ServiceCategoryView(category: category)
                        }
                    }
                }
                .padding()
                .onAppear {
                    viewModel.fetchServiceData()
                }
            }
            .applyBackground()
        }
    }
}


#Preview {
    HomeView()
}
