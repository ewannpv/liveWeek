//
//  CardModifier.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import SwiftUI

struct CardModifier: ViewModifier {
    
    // Constraints.
    let kCornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(kCornerRadius)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
