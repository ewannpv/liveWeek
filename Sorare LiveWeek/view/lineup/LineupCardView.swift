//
//  LineupCardView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import SwiftUI

// View that contains a list of player from the given 'lineup'.
struct LineupCardView: View {
    let lineup: Lineup
    
    // Constraints.
    let kCardPadding: CGFloat = 10
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Text(lineup.leagueName).font(.bold(.title2)())
                    Spacer()
                    Text("Limited")
                }.padding(.all, kCardPadding)
                Divider()
                    .padding(.horizontal, kCardPadding)
                HStack {
                    lineupRank()
                    Spacer()
                    Text(lineupScore(score: lineup.score))
                }.padding(.all, kCardPadding)
            }
            .foregroundColor(.white)
            .padding(.vertical, kCardPadding)
            
            VStack {
                ForEach(lineup.players) { player in
                    LineupPlayerRowView(player:  player)
                }
            }
            .background()
        }
        .background(.yellow)
        .modifier(CardModifier())
        .listRowBackground(Color.clear)
    }
    
    // MARK: Private methods
    
    // Returns the formated lineup rank for the given 'lineup'.
    private func lineupRank() -> some View {
        HStack {
            Text("\(lineup.ranking)TH")
                .font(.headline)
                .bold()
            Text("/ \(lineup.lineupsCount)")
                .font(.footnote)
        }
    }
    // Returns the lineup score.
    private func lineupScore(score: Double) -> String {
        return "\(Int(lineup.score))pts"
    }

}

struct LineupCardView_Previews: PreviewProvider {
    static var previews: some View {
        LineupCardView(lineup: Lineup.generateLineupExample(num: 1))
    }
}
