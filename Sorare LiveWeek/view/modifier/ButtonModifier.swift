//
//  ButtonModifier.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 27/07/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    // Constraints.
    let kButtonPadding: CGFloat = 5
    
    func body(content: Content) -> some View {
        content
            .padding(kButtonPadding)
            .background(Color.gray.opacity(0.4))
            .clipShape(Circle())
        
    }
    
}

