//
//  LogIn.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/11/23.
//

import SwiftUI

struct LogIn: View {
    var textfield = MainTextField(textfieldType: .username, placeholder: "Phone number, username or email", errorMessage: "No user found")
    var password = MainTextField(textfieldType: .password, placeholder: "Password", errorMessage: "Incorect password")
    var button = MainButton(text: "Log In", isDisabled: true)
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image("header2")
                    .resizable()
                    .scaledToFit()
                    //.ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Text("Hey You")
                        .font(.custom("Montserrat-Medium", size: 50))
                        .foregroundColor(Color("Cultured"))
                        .tracking(2)
                    
                    Text("Get up, get out, explore.")
                        .font(.custom("Montserrat-Medium", size: 18))
                        .foregroundColor(Color("Cultured"))
                        .tracking(2)
                }
            }
            
            ZStack(alignment: .top) {
                Color("Charcoal")
                
                VStack {
                    textfield
                        .padding(.bottom, UIScreen.main.bounds.height > 700 ? 0 : 20)
                    
                    password
                        .padding(.bottom, 10)
                    
                    button
                    
                    Spacer()
                    
                    Group {
                        Text("Forgot ")
                        
                        + Text("password ")
                            .foregroundColor(Color("Streetlight"))
                        + Text("or ")
                        
                        + Text("username")
                            .foregroundColor(Color("Streetlight"))
                    }
                    .font(.custom("Montserrat-Regular", size: 19))
                    .foregroundColor(Color("Cultured"))
                    .tracking(1.3)
                }
                .padding(.top, 30)
                .padding(.bottom, UIScreen.main.bounds.height > 700 ? 50 : 15)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
