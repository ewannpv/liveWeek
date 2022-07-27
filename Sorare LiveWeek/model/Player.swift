//
//  Player.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

// Object that contains player information.
struct Player: Identifiable, Decodable {
    var id: String
    var displayName:String
    var avatarUrl:String

    
    // Returns a fake Player object.
    static func generatePlayerExample(num:Int) -> Player {
        return Player(id:"\(num)", displayName: "Player\(num)", avatarUrl: "https://assets.sorare.com/seasonpicture/d30ad14a-0c0a-4ca1-a88a-87c0e2096037/picture/avatar-3d48e1f60ca1bae3c4924e45240e0ab6.png")
    }
}


