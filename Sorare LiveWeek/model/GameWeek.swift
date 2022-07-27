//
//  GameWeek.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

// Object that contains lineups corresponding to a period.
struct GameWeek: Decodable, Identifiable {
    var id = UUID()
    var displayWeek : String = ""
    var lineups = [Lineup]()

    var startDate: String
    var endDate: String
    var lineupIds: [String]
    
    private enum CodingKeys: String, CodingKey { case startDate, endDate,lineupIds }
    
    // Returns a fake GameWeek object.
    static func generateGameWeekExample(num: Int) -> GameWeek {
        var gameWeek = GameWeek(displayWeek:"Week name", startDate: "2022-0\(num)-15T11:00:00Z ", endDate: "2022-0\(num)-18T10:59:59Z", lineupIds: [String]())
        for num in 1...5 {
            gameWeek.lineupIds.append("\(num)")
            gameWeek.lineups.append(Lineup.generateLineupExample(num: num))
        }
        return gameWeek
    }
}


