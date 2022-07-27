//
//  Lineup.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

struct Lineup: Identifiable, Decodable {
    var id: String
    var score: Double
    var ranking: Int
    var lineupsCount: Int
    var leagueName: String
    var players: [Player]
}
