//
//  ViewModifier.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/9/24.
//

import Foundation
import SwiftUI

let uniGray = UIColor(named: "UniGray")

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "505050"))
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func applyBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
