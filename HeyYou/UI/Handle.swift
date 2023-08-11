//
//  Handle.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/9/23.
//

import SwiftUI

struct Handle: View {
    @State var checkHandlename = true
    @ObservedObject var keyboardManager = KeyboardManager()
    var textfield = MainTextField(textfieldType: .handlename, placeholder: "HereYou Handle", errorMessage: "Must be longer than 2 characters and No special characters (!, @, #, $, %, ^, &, *).")
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack(alignment: .center) {
                HStack {
                    Text("Hey You, Almost There!")
                        .titleStyle()
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Tell us who you are so friends could find you. This is the name people will see.")
                                .padding(.bottom)
                            Text("Your handlename must be unique, between 3-13 characters, and have no special characters.")
                                .padding(.bottom, 30)
                        }
                        .foregroundColor(Color("Cultured"))
                        .font(.custom("Montserrat-Regular", size: 18))
                        
                        Spacer()
                    }
                    .padding(.leading, UIScreen.main.bounds.height > 860 ? 3 : 7)
                    
                    
                    textfield
                        .padding(.bottom, UIScreen.main.bounds.height > 700 ? 20 : 30)
                    
                    MainButton(text: "Continue", isDisabled: textfield.checkValidation)
                    
                    if keyboardManager.isVisible && UIScreen.main.bounds.height < 700{
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height / 2.2)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.87)
            }
            .frame(width: UIScreen.main.bounds.width * 0.87)
            
            //.padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard)
        
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle()
    }
}
