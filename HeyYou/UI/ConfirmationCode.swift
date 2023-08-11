//
//  ConfirmationCode.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/11/23.
//

import SwiftUI

struct ConfirmationCode: View {
    
    @State var email = "mail@mail.com"
    var textfield1 = MainTextField(textfieldType: .code, placeholder: "Enter Code", errorMessage: "Hmm…that code isn’t valid. You can request to resend.")
    
    var button = MainButton(text: "Continue", isDisabled: true)
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack {
                HStack {
                    Text("Enter Confirmation Code")
                        .titleStyle()
                
                    Spacer()
                }
                
                HStack {
                    Text("Enter the confirmation code we sent to \(email). ")
                        .foregroundColor(Color("Cultured"))
                        .font(.custom("Montserrat-Regular", size: 18))
                    + Text("Resend Code.")
                        .foregroundColor(Color("Streetlight"))
                        .font(.custom("Montserrat-Regular", size: 18))
                    
                    Spacer()
                }
                .padding(.bottom)
                
                textfield1
                    .padding(.bottom, 30)
                    .keyboardType(.numberPad)
                
                button
            }
            .frame(width: UIScreen.main.bounds.width * 0.81)
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct ConfirmationCode_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmationCode()
        }
    }
}
