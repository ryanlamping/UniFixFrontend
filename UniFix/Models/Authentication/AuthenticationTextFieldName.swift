//
//  SwiftUIView.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/24/24.
//

import SwiftUI
import Foundation

struct AuthenticationTextFieldName: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.system(size: 17, weight: .light))
            .foregroundColor(Color(hex: "E1E587"))
            .frame(height: 15, alignment: .leading)
            .padding(.top, 10)
    }
}

