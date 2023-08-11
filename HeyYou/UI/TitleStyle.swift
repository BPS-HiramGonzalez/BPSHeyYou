//
//  TitleStyle.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/9/23.
//

import Foundation
import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Medium", size: 28))
            .foregroundColor(Color("Cultured"))
            .padding(.bottom, 20)
            .padding(.top)
            .tracking(1.3)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
