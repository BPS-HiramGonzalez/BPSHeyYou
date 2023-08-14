//
//  MainButton.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct MainButton: View {
    let text: String
    var isDisabled: Bool
    
    var body: some View {
            Button {
                
            } label: {
                Label(text, systemImage: "")
                    .font(.custom("Montserrat-Medium", size: 20))
                    .tracking(1.8)
                    .foregroundColor(Color("Cultured"))
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isDisabled ? Color("Slate_Gray") : Color("Streetlight"), lineWidth: 3)
                            .frame(height: UIScreen.main.bounds.width * 0.12)
                            //
                    )
                    //.frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.width * 0.12)
                    //.padding(.horizontal, 50)
            }
            .disabled(isDisabled)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Create Account", isDisabled: true)
    }
}
