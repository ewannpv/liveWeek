//
//  LoadingView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import SwiftUI

// View displayed while fetching data.
struct LoadingView: View {
    
    
    // Images.
    let kImageLoading : String = "icloud.fill"
    
    
    var body: some View {
        Image(systemName: kImageLoading)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
