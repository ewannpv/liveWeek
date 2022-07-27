//
//  Player.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

struct Player: Identifiable, Decodable {
    var id: String
    var displayName:String
    var avatarUrl:String
}
