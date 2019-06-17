//
//  PokemonController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation
import UIKit
// error
enum NetworkError: Error {
    case noDataReturned
    case noBearer
    case badAuth
    case apiError
    case noDecode
    
}
// push
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

// class starts here
class PokemonController {
    
    var pokemon: [Pokemon] = []
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    
    // Search for Pokemon
    func pokemonSearch(with title: String, completion: @escaping (Result <Pokemon, NetworkError>) -> Void) {
        
        let searchURL = baseURL.appendingPathComponent(title) // url search
        
        var request = URLRequest(url: searchURL)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            //error
            if let error = error {
                NSLog("Failed to search for Pokemon:\(error)")
                completion(.failure(.apiError))
                return
            }
            // data
            guard let data = data else {
                NSLog("Couldn't get data.")
                completion(.failure(.noDataReturned))
                return
            }
            
            do {// decode
                let decoder = JSONDecoder()
                let searching = try decoder.decode(Pokemon.self, from: data)
                completion(.success(searching))
            } catch {
                NSLog("Error decoding data:\(error)")
                completion(.failure(.noDecode))
                return
            }
            // dont forget resume
        } .resume()
        
        
    }
    
    
    

}
