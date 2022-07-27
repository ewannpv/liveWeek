//
//  APIServiceProtocol.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import Foundation

// Protocol used to fetch displayed data.
protocol APIServiceProtocol {
    
    // Fetchs the lineup at the given URL.
    func fetchLineup(url: URL?, completion: @escaping(Result<Lineup, APIError>) -> Void)
    
    // Fetchs the game week at the given URL.
    func fetchGameWeek(url: URL?, completion: @escaping(Result<GameWeek, APIError>) -> Void)
    
}
