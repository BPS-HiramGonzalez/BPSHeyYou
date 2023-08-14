//
//  AccountFound.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/14/23.
//

import SwiftUI

struct AccountFound: View {
    let handlename: String
    let userName: String
    @State var isDisabled = true
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack {
                HStack {
                    Text("The username or email is linked to this HeyYou account.")
                        .titleStyle()
                    Spacer()
                }
                .padding(.bottom)
                
                HStack {
                    Image("header")
                        .resizable()
                        .clipShape(
                            Circle()
                        )
                        .frame(width: 65, height: 65)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(handlename)
                        Text(userName)
                    }
                    .foregroundColor(Color("Cultured"))
                    
                    Spacer()
                    
                    Image("checkboxDisabled")
                        .onTapGesture {
                            isDisabled.toggle()
                        }
                }
                .padding(.bottom, 40)
                
                MainButton(text: "Log into \(handlename)", isDisabled: isDisabled)
                
            } // VStack
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct AccountFound_Previews: PreviewProvider {
    static var previews: some View {
        AccountFound(handlename: "Daworstgen67", userName: "JohnDoe")
    }
}
