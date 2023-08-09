//
//  MainTextField.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct MainTextField: View {
    
    enum inputType {
        case properName, username, handlename, email, phone
    }
    
    let regex = [
        "properNames" : "^[A-Za-z-]{3,13}$",
        "username" : "^[A-Za-z0-9\\.-_]{4,}$",
        "handlename" : "[A-Za-z0-9]{3,13}",
        "email" : "^([a-z0-9\\.-]{1,})@([a-z0-9-]{1,})\\.([a-z]{2,8})(\\.[a-z]{2,8})?$",
        "phone" : "^[0-9]{10}$"
    ]
    
    @State var text: String = ""
    
    let textfieldType: inputType
    let placeholder: String
    let errorMessage: String
    @Binding var checkValidation: Bool
    @State var isIncorrect: Bool = false
    @FocusState var isFocused: Bool
    @State var isTyping = false
    
    @State var isTextEmpty = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                VStack {
                    ZStack {
                        TextField("", text: $text, prompt: Text(placeholder).foregroundColor(isIncorrect ? Color("Sunset") : Color("Cultured")))
                            .padding()
                            .foregroundColor(Color("Cultured"))
                            .focused($isFocused)
                            .onChange(of: text) { newValue in
                                validateTextField(ofType: textfieldType, text: text)
                                if text.isEmpty {
                                    checkValidation = true
                                }
                                withAnimation {
                                    isTextEmpty = newValue.isEmpty
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(isIncorrect ? Color("Sunset") : Color("Cultured"), lineWidth: 2)
                            )
                        
                        HStack {
                            if !isTextEmpty {
                                Text(placeholder)
                                    .font(.custom("Moontserrat-Regular", size: !isTextEmpty ? 13 : 18))
                                    .padding(.horizontal, !isTextEmpty ? 5 : 0)
                                    .background(!text.isEmpty ? Color.black.opacity(1) : Color.black.opacity(0))
                                    .foregroundColor(isIncorrect ? Color("Sunset") : Color("Cultured"))
                                //.position(x: geo.frame(in: .local).minX + 56.5, y: geo.frame(in: .local).midY)
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 3)
                                            .stroke(isIncorrect ? Color("Sunset") : Color("Cultured"), lineWidth: 1)
                                    )
                                    .offset(y: !isTextEmpty ? -28 : 0)
                                    
                            }
                            
                            Spacer()
                            
                            if isIncorrect {
                                Button {
                                    text = ""
                                } label: {
                                    Image("menuCloseSmall")
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        .padding(.leading)

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.81)
                    .onTapGesture {
                        if text.isEmpty {
                            withAnimation {
                                isTyping.toggle()
                            }
                        }
                    }
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(isIncorrect ? Color("Sunset") : Color.white, lineWidth: 2)
//                    )
                    
                    
                    if isIncorrect {
                        Text(errorMessage)
                            .font(.custom("Montserrat-Regular", size: 13))
                            .foregroundColor(Color("Sunset"))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: UIScreen.main.bounds.width * 0.77)
                    }
                }
                
                
            }
            .frame(height: isIncorrect ? UIScreen.main.bounds.height > 700 ? UIScreen.main.bounds.height * 0.105 : UIScreen.main.bounds.height * 0.15 : UIScreen.main.bounds.height * 0.09)
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
            case .phone:
                return "phone"
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
