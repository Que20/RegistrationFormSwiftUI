//
//  ContentView.swift
//  RegistrationFormSwiftUI
//
//  Created by Kevin Maarek on 01/07/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var terms: Bool = false
    @ObjectBinding var passwordChecker: PasswordChecker = PasswordChecker()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Info")) {
                    TextField($name, placeholder: Text("Name"))
                    TextField($email, placeholder: Text("Email"))
                }
                Section(header: Text("Password")) {
                    SecureField($passwordChecker.password, placeholder: Text("Password"), onCommit: { })
                    if self.passwordChecker.password.isEmpty == false {
                        SecureLevelView(level: self.passwordChecker.level)
                    }
                }
                Section {
                    if self.passwordChecker.level.rawValue >= 2 {
                        Toggle(isOn: $terms) {
                            Text("Accept the terms and conditions")
                        }
                        if self.terms {
                            Button(action: {
                                print("register account")
                            }) {
                                Text("OK")
                            }
                        }
                    }
                }
                }
                .navigationBarTitle(Text("Registration Form"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
