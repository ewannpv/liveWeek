//
//  GameWeekFetcher.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 25/07/2022.
//

import Foundation

// Service that provides GameWeek objects.
class GameWeekFetcher: ObservableObject {
    let baseURL: String = "https://ewannpv.com/ios/sorare/"
    var currentGameWeekURL: String {
        return baseURL + "current_week.json"
    }
    var gameWeeksURL: [String] {
        return [ baseURL + "current_week.json", baseURL + "next_week.json"]
    }
    
    @Published var gameWeeks = [GameWeek]()
    
    @Published var isLoading : Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchGameWeeks()
    }
    
    // MARK: Private methods

    //  Fetchs and stores game weeks from 'gameWeeksURL'.
    private func fetchGameWeeks() {
        isLoading = true
        errorMessage = nil
        
        for (gameWeekIndex,gameWeeksUrl) in gameWeeksURL.enumerated() {
            let url = URL(string: gameWeeksUrl)
            
            service.fetchGameWeek(url: url) { [unowned self] result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    case .success(let gameWeek):
                        self.gameWeeks.append(gameWeek)
                        for lineupId in gameWeek.lineupIds {
                            self.fetchLineupWithId(lineupId: lineupId, gameWeekIndex:gameWeekIndex)
                        }
                    }
                }
            }
        }

    }
    
    //  Fetchs and stores the given 'lineupId' at the correspondig 'gameWeekIndex'.
    private func fetchLineupWithId(lineupId: String, gameWeekIndex: Int) {
        let url = URL(string: baseURL + "lineup-" + lineupId + ".json")
        
        service.fetchLineup(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let lineup):
                    self.gameWeeks[gameWeekIndex].lineups.append(lineup)
                }
            }
        }
    }
    
}
