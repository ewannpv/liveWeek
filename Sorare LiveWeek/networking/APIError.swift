//
//  APIError.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import Foundation

// Enum used to display API errors.
enum APIError: Error {
    
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }

}
