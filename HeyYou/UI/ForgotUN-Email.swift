//
//  ForgotUN-Email.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/14/23.
//

import SwiftUI

struct ForgotUN_Email: View {
    @ObservedObject var keyboardManager = KeyboardManager()
    @State private var index = 0
    let textfieldEmail = MainTextField(textfieldType: .email, placeholder: "Your email", errorMessage: "Hey you, no user found. Make sure you’ve spelled your email correctly.")
    let textfieldPhone = MainTextField(textfieldType: .phone, placeholder: "Your phone", errorMessage: "")
    let button = MainButton(text: "Continue", isDisabled: true)
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
            VStack {
                HStack {
                    Text("You forgot your username. Luckily, we got you.")
                        .titleStyle()
                    
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Enter your email and we’ll send you a link to get back into your HeyYou account.")
                                .foregroundColor(Color("Cultured"))
                                .font(.custom("Montserrat-Regular", size: 18))
                            
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                        
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
                        
                        button
                        
                    }
                    .padding(.bottom, keyboardManager.isVisible ? keyboardManager.keyboardHeight : 0)
                    //.frame(width: UIScreen.main.bounds.width * 0.9)
                }
                NavigationLink {
                    LogIn()
                } label: {
                    Text("Back To Log In")
                        .foregroundColor(Color("Streetlight"))
                        .font(.custom("Montserrat-Medium", size: 20))
                        .padding(.bottom)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ForgotUN_Email_Previews: PreviewProvider {
    static var previews: some View {
        ForgotUN_Email()
    }
}
