//
//  ContentView.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to...")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Image("UniFix transparent")
                    .resizable()
                    .frame(width: 310)
                    .frame(height: 90)
            }
            .padding()
            .applyBackground()
        }
    }
}

#Preview {
    ContentView()
}
