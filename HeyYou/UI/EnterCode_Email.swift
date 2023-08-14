//
//  EnterCode_Email.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/14/23.
//

import SwiftUI

struct EnterCode_Email: View {
    @ObservedObject var keyboardManager = KeyboardManager()
    enum CodeType {
        case email, phone
    }
    let codeType: CodeType
    let userInput: String
    let textfieldCode = MainTextField(textfieldType: .code, placeholder: "Code", errorMessage: "This isn't the code, please try again.")
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack {
                HStack {
                    Text("Hey you, check your \(codeType == .email ? "email" : "phone").")
                        .titleStyle()
                    
                    Spacer()
                }
                
                HStack {
                    Text("We sent a 6 diget code to \(userInput). \nEnter it below or")
                        .foregroundColor(Color("Cultured"))
                        .font(.custom("Montserrat-Regular", size: 18))
                    + Text(" request a new one.")
                        .foregroundColor(Color("Streetlight"))
                        .font(.custom("Montserrat-Regular", size: 18))
                    
                    Spacer()
                }
                .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                
                textfieldCode
                    .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                    .keyboardType(.decimalPad)
                
                MainButton(text: "Continue", isDisabled: true)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            //.padding(.bottom, keyboardManager.isVisible ? keyboardManager.keyboardHeight : 0)
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct EnterCode_Email_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnterCode_Email(codeType: .email, userInput: "johndoe@heyyou.com")
        }
    }
}
