//
//  PokemonController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case apiError
    case badData
    case noDecode
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class PokemonController {
    
    var pokemons: [Pokemon] = []
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/")!
    
    // Search for Pokemon
    func pokemonSearch(with title: String, completion: @escaping (Result < Pokemon, NetworkError >) -> Void) {
        
        let searchURL = baseURL.appendingPathComponent(title)
        
        var request = URLRequest(url: searchURL)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                NSLog("Failed to search for Pokemon:\(error)")
                completion(.failure(.apiError))
            }
            
            guard let data = data else {
                NSLog("Couldn't get data.")
                completion(.failure(.noAuth))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let searching = try decoder.decode(Pokemon.self, from: data)
                completion(.success(searching))
            } catch {
                NSLog("Error decoding data:\(error)")
                completion(.failure(.noDecode))
                return
            }
            
        } .resume()
        
        
    }
    

}
