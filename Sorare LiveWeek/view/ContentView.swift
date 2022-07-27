//
//  ContentView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import SwiftUI

// Primary view.
struct ContentView: View {
    @StateObject var gameWeekFetcher = GameWeekFetcher()
    
    var body: some View {
        if gameWeekFetcher.isLoading {
            LoadingView()
        } else if  gameWeekFetcher.errorMessage != nil{
            ErrorView(errorMessage: gameWeekFetcher.errorMessage!)
        } else {
            LineupListView(gameWeeks: gameWeekFetcher.gameWeeks)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
