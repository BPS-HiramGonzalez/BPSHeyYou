//
//  KeyboardManager.swift
//  HeyYou
//
//  Created by BPS.Dev01 on 8/10/23.
//

import Foundation
import UIKit
import Combine

class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var isVisible = false
    
    var keyboardCancellable: Cancellable?
    
    init() {
        keyboardCancellable = NotificationCenter.default
            .publisher(for: UIWindow.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                
                guard let userInfo = notification.userInfo else { return }
                guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                
                self.isVisible = keyboardFrame.minY < UIScreen.main.bounds.height
                self.keyboardHeight = self.isVisible ? keyboardFrame.height : 0
            }
    }
    
}
