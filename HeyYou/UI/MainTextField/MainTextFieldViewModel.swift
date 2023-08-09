//
//  MainTextFieldViewModel.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/8/23.
//

import Foundation

extension MainTextField {
    
    @MainActor class ViewModel: ObservableObject {
        @Published var isInvalid = false
        
        enum inputType {
            case properName, username, handlename, email
        }
        
        let regex = [
            "properNames" : "^[A-Za-z-]{3,13}$",
            "username" : "^[A-Za-z0-9\\.-_]{4,}$",
            "handlename" : "[A-Za-z0-9]{3,13}",
            "email" : "^([a-z0-9\\.-]{1,})@([a-z0-9-]{1,})\\.([a-z]{2,8})(\\.[a-z]{2,8})?$"
        ]
        
        init() { }
        
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
            isInvalid = predicate.evaluate(with: text)
            print("validated: \(isInvalid)")
        }
        
    }
}
