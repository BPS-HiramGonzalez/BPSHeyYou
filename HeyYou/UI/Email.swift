//
//  Email.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/9/23.
//

import SwiftUI

struct Email: View {
    @State var checkEmail = true
    @State var checkPhone = true
    @State private var index = 0
    var textfieldEmail = MainTextField(textfieldType: .email, placeholder: "Email", errorMessage: "Hey you, this email is already being used. Please enter another email.")
    var textfieldPhone = MainTextField(textfieldType: .phone, placeholder: "Phone", errorMessage: "")
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack {
                Text("Enter Phone or Email for Verification")
                    .titleStyle()
                
                HStack(spacing: 0) {
                    VStack(spacing: 20) {
                        Text("EMAIL")
                            .font(.custom("Montserrat-Medium", size: 17))
                            .foregroundColor(index == 0 ? Color("Streetlight") : Color("Streetlight").opacity(0.4))
                            
                        
                        Rectangle()
                            .stroke(index == 0 ? Color("Streetlight") : Color("Streetlight").opacity(0.4), lineWidth: 1)
                            .frame(width: UIScreen.main.bounds.width / 2 , height: 1)
                    }
                    .onTapGesture {
                        withAnimation {
                            index = 0
                        }
                    }
                    
                    
                    VStack(spacing: 20) {
                        Text("PHONE")
                            .font(.custom("Montserrat-Medium", size: 17))
                            .foregroundColor(index == 1 ? Color("Streetlight") : Color("Streetlight").opacity(0.4))
                        
                        Rectangle()
                            .stroke(index == 1 ? Color("Streetlight") : Color("Streetlight").opacity(0.4), lineWidth: 1)
                            .frame(width: UIScreen.main.bounds.width / 2 , height: 1)
                    }
                    .onTapGesture {
                        withAnimation {
                            index = 1
                        }
                    }
                }
                .animation(.linear(duration: 0.2), value: index)
                
                TabView(selection: $index) {
                    VStack(alignment: .center) {
                        textfieldEmail
                            .padding()
                    }
                    .tag(0)
                    .keyboardType(.emailAddress)
                    
                    VStack(alignment: .center) {
                        textfieldPhone
                            .padding()
                    }
                    .tag(1)
                    .keyboardType(.phonePad)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: UIScreen.main.bounds.height * 0.2)
                
                MainButton(text: "Continue", isDisabled: textfieldEmail.checkValidation && textfieldPhone.checkValidation)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct Email_Previews: PreviewProvider {
    static var previews: some View {
        Email()
    }
}
