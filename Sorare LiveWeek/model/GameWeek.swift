//
//  GameWeek.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

struct GameWeek: Identifiable, Decodable {
    var id = UUID()
    var startDate: String
    var endDate: String
    var lineupIds: [String]
    var lineup: [Lineup]
}

