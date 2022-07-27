//
//  APIService.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import Foundation
import SwiftUI

struct APIService: APIServiceProtocol {
    
    func fetchLineup(url: URL?, completion: @escaping(Result<Lineup, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let lineup = try decoder.decode(Lineup.self, from: data)
                    completion(Result.success(lineup))
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
            task.resume()
    }
    
    func fetchGameWeek(url: URL?, completion: @escaping (Result<GameWeek, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let gameWeek = try decoder.decode(GameWeek.self, from: data)
                    completion(Result.success(gameWeek))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
}
