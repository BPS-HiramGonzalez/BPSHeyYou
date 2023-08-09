//
//  MainTextField.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct MainTextField: View {
    //@ObservedObject var viewModel = MainTextField.ViewModel()
    
    enum inputType {
        case properName, username, handlename, email
    }
    
    let regex = [
        "properNames" : "^[A-Za-z-]{3,13}$",
        "username" : "^[A-Za-z0-9\\.-_]{4,}$",
        "handlename" : "[A-Za-z0-9]{3,13}",
        "email" : "^([a-z0-9\\.-]{1,})@([a-z0-9-]{1,})\\.([a-z]{2,8})(\\.[a-z]{2,8})?$"
    ]
    
    @State var text: String = ""
    
    let textfieldType: inputType
    let placeholder: String
    let errorMessage: String
    @Binding var checkValidation: Bool
    @State var isIncorrect: Bool = false
    
    @State var isTyping = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                VStack {
                    HStack {
                        TextField("", text: $text, prompt: Text(placeholder).foregroundColor(Color("Cultured")))
                            .padding()
                            .foregroundColor(Color("Cultured"))
                            .onChange(of: text) { newValue in
                                validateTextField(ofType: textfieldType, text: text)
                                if text.isEmpty {
                                    checkValidation = true
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    isTyping.toggle()
                                }
                            }
                        
                        if isIncorrect {
                            Button {
                                text = ""
                            } label: {
                                Image("menuCloseSmall")
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.81)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isIncorrect ? Color("Sunset") : Color.white, lineWidth: 2)
                    )
                    
                    
                    if isIncorrect {
                        Text(errorMessage)
                            .font(.custom("Montserrat-Regular", size: 13))
                            .foregroundColor(Color("Sunset"))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: UIScreen.main.bounds.width * 0.77)
                    }
                }
                
                
                Text(placeholder)
                    //.font(.custom("Montserrat-Regular", size: 25))
                    .foregroundColor(isIncorrect ? Color("Sunset") : Color("Cultured"))
                    .position(x: geo.frame(in: .local).minX + 56.5, y: geo.frame(in: .local).midY)
                    .offset(y: isTyping ? -40 : 0)
                
                //.background(.white.opacity(1))
                //.position(x: geo.frame(in: .local).minX + 50, y: geo.frame(in: .local).minY)
                
                
            }
            .frame(height: isIncorrect ? UIScreen.main.bounds.height * 0.12 : UIScreen.main.bounds.height * 0.09)
        }
        .onAppear {
            if text.isEmpty {
                checkValidation = true
            }
        }
    }
    
    func validateTextField(ofType type: inputType, text: String) {
        var selectedType: String {
            switch type {
            case .properName:
                return "properNames"
            case .username:
                return "username"
            case .handlename:
                return "handlename"
            case .email:
                return "email"
            }
        }
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex[selectedType]!)
        isIncorrect = !predicate.evaluate(with: text)
        checkValidation = isIncorrect
        print("validated: \(isIncorrect)")
    }
}

//struct MainTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTextField(textfieldType: .email, placeholder: "First Name", errorMessage: "Your name should be 3-13 characters long and have no special characters (!, @, #, $, %, ^, &, *).")
//    }
//}
