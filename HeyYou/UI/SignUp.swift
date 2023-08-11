//
//  SignUp.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct SignUp: View {

    @State var checkFirstName = false
    @State var checkLastName = false
    @State var checkUsername = false
    

    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            VStack(alignment: .center) {
                HStack {
                    Text("Sign Up")
                        .titleStyle()
                    Spacer()
                }
                
                
                MainTextField(textfieldType: .properName, placeholder: "First Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).")
                    .padding(.bottom, UIScreen.main.bounds.height > 700 ? 0 : 15)

 
                MainTextField(textfieldType: .properName, placeholder: "Last Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).")
                    .padding(.bottom, 15)
                
                HStack {
                    Text("Hey you, your username cannot be changed.")
                        .font(.custom("Montserrat-Medium", size: 13))
                        .foregroundColor(Color("Cultured"))
                        .tracking(1)
                        .fixedSize(horizontal: true, vertical: false)
                    Spacer()
                }
                .padding(.bottom, 7)
                
                MainTextField(textfieldType: .username, placeholder: "Username", errorMessage: "Username should be longer than 3 characters and must be unique.")
                
                MainButton(text: "Continue", isDisabled: checkUsername || checkFirstName || checkLastName)
                    .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width * 0.81)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
