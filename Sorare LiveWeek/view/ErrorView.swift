//
//  ErrorView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import SwiftUI

// View displayed when an error occurred while fetching data.
struct ErrorView: View {
    var errorMessage: String

    var body: some View {
        Text(errorMessage)
    }

}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Error message")
    }
}
