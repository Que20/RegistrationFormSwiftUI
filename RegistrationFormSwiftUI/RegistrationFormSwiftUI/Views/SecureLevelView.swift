//
//  SwiftUIView.swift
//  RegistrationFormSwiftUI
//
//  Created by Kevin Maarek on 01/07/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import SwiftUI

enum PasswordLevel: Int {
    case none = 0
    case weak = 1
    case ok = 2
    case strong = 3
}

struct SecureLevelView : View {
    var level: PasswordLevel
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[0]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[1]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[2]).frame(height: 10)
        }
    }
    
    func getColors() -> [Color] {
        switch self.level {
        case .none:
            return [.clear, .clear, .clear]
        case .weak:
            return [.red, .clear, .clear]
        case .ok:
            return [.red, .orange, .clear]
        case .strong:
            return [.red, .orange, .green]
        }
    }
}

#if DEBUG
struct SecureLevelView_Previews : PreviewProvider {
    static var previews: some View {
        SecureLevelView(level: .none)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
