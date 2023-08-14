//
//  Password.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/10/23.
//

import SwiftUI

struct Password: View {
    @State var textfield1: MainTextField
    @State var textfield2 = MainTextField(textfieldType: .password, placeholder: "Confirm Password", errorMessage: "Hey you! Passwords do not match.")
    //@State var textfield2: MainTextField
    
    //@State var button: MainButton
    
    @State var checkPassword = true
    @State var checkConfirmPassword = true
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
            
            
            VStack(alignment: .center) {
                
                HStack {
                    Text("Last Step.\nMake a Password.")
                        .titleStyle()
                        
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Password must contain at least 6 characters, 1 upper case letter, 1 lower case letter and 1 special character.")
                                .foregroundColor(Color("Cultured"))
                                .font(.custom("Montserrat-Regular", size: 18))
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.81)
                        .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                        
                        textfield1
                            .padding(.bottom, UIScreen.main.bounds.height > 700 ? 0 : 20)
                                
                        textfield2
                            .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                        
                        
                        
                        MainButton(text: "Complete", isDisabled: "" == textfield2.getText())
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.81)
            
        }
    }
    
    init() {
        _textfield1 = State(initialValue: MainTextField(textfieldType: .password, placeholder: "Password", errorMessage: "Your password should be at least 8 characters long, contain a lowercase and an uppercase letter, a number and a special character (!, @, #, $, %, ^, &, *) at least."))
//        _textfield2 = State(initialValue: MainTextField(textfieldType: .password, placeholder: "Confirm Password", errorMessage: "Hey you! Passwords do not match."))
//        _button = State(initialValue: MainButton(text: "Complete", isDisabled: (textfield1.checkValidation || textfield2.checkValidation) || textfield1.text != textfield2.text))
    }
}

struct Password_Previews: PreviewProvider {
    static var previews: some View {
        Password()
    }
}
