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
                        .frame(width: geo.size.width, height: geo.size.height * 0.3)
                    
                    
                    VStack(alignment: .center) {
                        Text("Hey You")
                            .font(.custom("Montserrat-Medium", size: 50))
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom,1 )
                            .tracking(3)
                        Text("Out With A Purpose.")
                            .font(.custom("Montserrat-Semibold", size: 20))
                            .tracking(1.5)
                        
                        VStack(alignment: .center) {
                            Text("Find and build communities with people in your area.")
                            Text("#HelloConnections")
                            Text("#Community")
                        }
                        .padding(.vertical, 30)
                        .font(.custom("Montserrat-Regular", size: 18))
                        .multilineTextAlignment(.center)
                        .tracking(1.7)
                        .frame(width: geo.size.width * 2 / 3)
                        
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
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(Color("Cultured"))
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
