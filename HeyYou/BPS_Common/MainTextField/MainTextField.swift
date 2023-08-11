//
//  MainTextField.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/7/23.
//

import SwiftUI

struct MainTextField: View {
    
    enum inputType {
        case properName, username, handlename, email, phone, password, code
    }
    
    let regex = [
        "properNames" : "^[A-Za-z-]{3,13}$",
        "username" : "^[A-Za-z0-9\\.-_]{4,}$",
        "handlename" : "[A-Za-z0-9]{3,13}",
        "email" : "^([a-z0-9\\.-]{1,})@([a-z0-9-]{1,})\\.([a-z]{2,8})(\\.[a-z]{2,8})?$",
        "phone" : "^[0-9]{10}$",
        "password" : "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$",
        "code" : "^[0-9]{6}$"
    ]
    
    @State private(set) var text: String = ""
    
    let textfieldType: inputType
    let placeholder: String
    let errorMessage: String
    @State var checkValidation: Bool = true
    @State var isIncorrect: Bool = false
    //@FocusState var isFocused: Bool
    @State var isTyping = false
    @State var hideTextField = false
    @State var isTextEmpty = true
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    ZStack {
                        ZStack {
                            if textfieldType == .password {
                                SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(isIncorrect ? Color("Sunset") : Color("Cultured")))
                                    .padding()
                                    .foregroundColor(Color("Cultured"))
                                    //.focused($isFocused)
                                    .onChange(of: text) { newValue in
                                        validateTextField(ofType: textfieldType, text: text)
                                        if text.isEmpty {
                                            checkValidation = true
                                        }
                                        withAnimation {
                                            isTextEmpty = newValue.isEmpty
                                        }
                                    }
                                    .opacity(hideTextField ? 1 : 0)
                                    .frame(width: UIScreen.main.bounds.width * 0.81 * 0.8)
                            }
                            
                            TextField("", text: $text, prompt: Text(placeholder).foregroundColor(isIncorrect ? Color("Sunset") : Color("Cultured")))
                                .padding()
                                .foregroundColor(Color("Cultured"))
                                //.focused($isFocused)
                                .onChange(of: text) { newValue in
                                    validateTextField(ofType: textfieldType, text: text)
                                    if text.isEmpty {
                                        checkValidation = true
                                    }
                                    withAnimation {
                                        isTextEmpty = newValue.isEmpty
                                    }
                                }
                                .opacity(hideTextField ? 0 : 1)
                                .frame(width: UIScreen.main.bounds.width * 0.81 * 0.8)
                            
                        }
                        .offset(x: -UIScreen.main.bounds.width * 0.08)
                        

                        
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
                            
                            Button {
                                text = ""
                            } label: {
                                Image("menuCloseSmall")
                                    .padding(.trailing, textfieldType == .password ? 0 : 10)
                            }
                            
                            if textfieldType == .password {
                                Button {
                                    hideTextField.toggle()
                                } label: {
                                    Image(hideTextField ? "editShow" : "editHide")
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isIncorrect ? Color("Sunset") : Color("Cultured"), lineWidth: 2)
                    )
                    
                    if isIncorrect {
                        Text(errorMessage)
                            .font(.custom("Montserrat-Regular", size: 13))
                            .foregroundColor(Color("Sunset"))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: UIScreen.main.bounds.width * 0.77)
                            
                    } // ZStack
                } // VStack
                
            } // Geo
            .frame(height: textfieldType == .password && isIncorrect ? UIScreen.main.bounds.height > 700 ? UIScreen.main.bounds.height * 0.12 : UIScreen.main.bounds.height * 0.17 : isIncorrect ? UIScreen.main.bounds.height > 700 ? UIScreen.main.bounds.height * 0.105 : UIScreen.main.bounds.height * 0.12 : UIScreen.main.bounds.height * 0.09)
            
        } // ZStack
        .onAppear {
            if text.isEmpty {
                checkValidation = true
            }
            if textfieldType == .password {
                hideTextField = true
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.82)
    } // View
    
    
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
            case .password:
                return "password"
            case .code:
                return "code"
            }
        }
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex[selectedType]!)
        isIncorrect = !predicate.evaluate(with: text)
        checkValidation = isIncorrect
        print("validated: \(isIncorrect)")
    }
}

struct MainTextField_Previews: PreviewProvider {
    @State static var test: Bool = true
    static var previews: some View {
        MainTextField(textfieldType: .password, placeholder: "Password", errorMessage: "Your password should be at least 8 characters long, contain a lowercase and an uppercase letter, a number and a special character (!, @, #, $, %, ^, &, *) at least.")
    }
}
