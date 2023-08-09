//
//  Handle.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/9/23.
//

import SwiftUI

struct Handle: View {
    @State var checkHandlename = true
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            VStack(alignment: .leading) {
                Text("Hey You, Almost There!")
                    .titleStyle()
                
                VStack(alignment: .leading) {
                    Text("Tell us who you are so friends could find you. This is the name people will see.")
                        .padding(.bottom)
                    Text("Your handlename must be unique, between 3-13 characters, and have no special characters.")
                }
                .foregroundColor(Color("Cultured"))
                .font(.custom("Montserrat-Regular", size: 18))
                
                
                MainTextField(textfieldType: .handlename, placeholder: "HereYou Handle", errorMessage: "Must be longer than 2 characters and No special characters (!, @, #, $, %, ^, &, *).", checkValidation: $checkHandlename)
                
                MainButton(text: "Continue", isDisabled: checkHandlename)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle()
    }
}
