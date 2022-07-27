//
//  LineupListView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import SwiftUI

// TableView that contains a list of lineup for the each 'gameWeeks'.
struct LineupListView: View {
    let gameWeeks: [GameWeek]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(Array(gameWeeks.enumerated()), id: \.1.id) { (gameWeekIndex, gameWeek) in
                    VStack {
                        LineupListHeaderView(gameWeekIndex: gameWeekIndex, gameWeek: gameWeek)
                        List {
                            ForEach(gameWeek.lineups) { lineup in
                                LineupCardView(lineup: lineup)
                            }
                        }
                        .padding()
                        .listStyle(.plain)
                        
                    }
                    .edgesIgnoringSafeArea(.bottom)

                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .edgesIgnoringSafeArea(.bottom)
        .background(.black)
        
    }

}

struct LineupListView_Previews: PreviewProvider {
    static var previews: some View {
        LineupListView(gameWeeks: [GameWeek.generateGameWeekExample(num: 1),GameWeek.generateGameWeekExample(num: 2)])
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
