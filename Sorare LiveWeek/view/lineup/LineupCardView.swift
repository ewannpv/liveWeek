//
//  LineupCardView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import SwiftUI

struct LineupCardView: View {
    let lineup: Lineup
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Text(lineup.leagueName).font(.bold(.title2)())
                    Spacer()
                    Text("Limited")
                }.padding(.all, 10)
                Divider()
                    .padding(.horizontal, 10)
                HStack {
                    Text(lineupRank(rank:lineup.ranking))
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text(lineupScore(score: lineup.score))
                }.padding(.all, 10)
            }
            .foregroundColor(.white)
            .padding(.vertical, 10)
            
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

    private func lineupRank(rank: Int) -> String {
        return "\(rank)TH"
    }
    
    private func lineupScore(score: Double) -> String {
        return "\(Int(lineup.score))pts"
    }
}

struct LineupCardView_Previews: PreviewProvider {
    static var previews: some View {
        LineupCardView(lineup: Lineup.generateLineupExample(num: 1))
    }
}
