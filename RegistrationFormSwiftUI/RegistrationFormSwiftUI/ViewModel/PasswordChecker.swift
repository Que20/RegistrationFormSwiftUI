//
//  PasswordChecker.swift
//  RegistrationFormSwiftUI
//
//  Created by Kevin Maarek on 01/07/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PasswordChecker: BindableObject {
    public let didChange = PassthroughSubject<PasswordChecker, Never>()
    var password: String = "" {
        didSet {
            self.checkForPassword(password: self.password)
        }
    }
    
    var level: PasswordLevel = .none {
        didSet {
            self.didChange.send(self)
        }
    }
    
    func checkForPassword(password: String) {
        if password.count == 0 {
            self.level = .none
        } else if password.count < 2 {
            self.level = .weak
        } else if password.count < 6 {
            self.level = .ok
        } else {
            self.level = .strong
        }
    }
}
