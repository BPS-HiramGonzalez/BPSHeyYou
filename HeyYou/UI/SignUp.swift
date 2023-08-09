//
//  SignUp.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct SignUp: View {
    //@ObservedObject var textfieldModel = MainTextField.ViewModel()
    @State var checkFirstName = false
    @State var checkLastName = false
    @State var checkUsername = false
    
//    var firstName = MainTextField(textfieldType: .properName, placeholder: "First Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).")
//    var lastName = MainTextField(textfieldType: .properName, placeholder: "Last Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).")
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            VStack(alignment: .center) {
                HStack {
                    Text("Sign Up")
                        .font(.custom("Montserrat-Medium", size: 28))
                        .foregroundColor(Color("Cultured"))
                        .padding(.bottom, 20)
                    Spacer()
                }
                
                
                MainTextField(textfieldType: .properName, placeholder: "First Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).", checkValidation: $checkFirstName)

 
                MainTextField(textfieldType: .properName, placeholder: "Last Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).", checkValidation: $checkLastName)
                
                HStack {
                    Text("Hey you, your username cannot be changed.")
                        .font(.custom("Montserrat-Medium", size: 13))
                        .foregroundColor(Color("Cultured"))
                        .tracking(1)
                    Spacer()
                }
                .padding(.bottom, 7)
                
                MainTextField(textfieldType: .username, placeholder: "Username", errorMessage: "Username should be longer than 3 characters and must be unique.", checkValidation: $checkUsername)
                
                MainButton(text: "Continue", isDisabled: checkUsername || checkFirstName || checkLastName)
                    .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width * 0.81)
            //.padding(.leading, 13)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
