//
//  Lineup.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

// Object that contains lineup information and its players.
struct Lineup: Identifiable, Decodable {
    var id: String
    var score: Double
    var ranking: Int
    var lineupsCount: Int
    var leagueName: String
    var players: [Player]
    
    // Returns a fake Lineup object.
    static func generateLineupExample(num: Int) -> Lineup {
        return Lineup(id: "\(num)", score: 100, ranking: 1, lineupsCount: 50, leagueName: "LeagueName \(num)", players: {
            var players = [Player]()
            for num in 1...5 {
                players.append(Player.generatePlayerExample(num: num))
            }
            return players
        }())
    }
}


