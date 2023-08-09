//
//  ContentView.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct Onboarding: View {
    @State var isLinkActivated = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Image("header")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geo.size.width, height: geo.size.height * 0.2)
                    
                    
                    VStack(alignment: .center) {
                        Text("Hey You")
                            .font(.custom("Montserrat-Medium", size: UIScreen.main.bounds.height > 700 ? UIScreen.main.bounds.height > 860 ? 50 : 48 : 45))
                            .bold()
                            .padding(.top, UIScreen.main.bounds.height > 700 ? -5 : 0)
                            .padding(.bottom, 1)
                            .tracking(3)
                        Text("Out With A Purpose.")
                            .font(.custom("Montserrat-Semibold", size: UIScreen.main.bounds.height > 700 ? 20: 15))
                            .tracking(1.5)
                        
                        VStack(alignment: .center) {
                            Text("Find and build communities with people in your area.")
                            Text("#HelloConnections")
                            Text("#Community")
                        }
                        .padding(.vertical, UIScreen.main.bounds.height > 700 ? 35 : 20)
                        .font(.custom("Montserrat-Regular", size: UIScreen.main.bounds.height > 700 ? UIScreen.main.bounds.height > 860 ? 20 : 18 : 15))
                        .multilineTextAlignment(.center)
                        .tracking(1.7)
                        .frame(maxWidth: UIScreen.main.bounds.height > 700 ? geo.size.width * 2 / 3 : geo.size.width * 0.7)
                        
                        MainButton(text: "Create Account", isDisabled: false)
                            .padding(.bottom, 9)
                        
                        HStack(spacing: 0) {
                            Text("Already have a account? ")
                            Text("Log In")
                                .foregroundColor(Color("Streetlight"))
                                .onTapGesture {
                                    isLinkActivated = true
                                }
                        }
                        .padding(.top, 4)
                        .font(.custom("Montserrat-Regular", size: 14))
                        .tracking(1.8)
                        
                        Spacer()
                        
                        HStack {
                            Text("By using this app you agree with the ") +
                            Text("terms of service.")
                                .foregroundColor(Color("Streetlight"))
                                .underline()
                        }
                        .font(.custom("Montserrat-Medium", size: 14))
                        //.padding(.bottom)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, height: geo.frame(in: .global).height * 0.62)
                    .foregroundColor(Color("Cultured"))
                    .padding(.top, 70)
                }
            }
            .background(Color("Charcoal"))
        }
    }
    
    func openView() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
