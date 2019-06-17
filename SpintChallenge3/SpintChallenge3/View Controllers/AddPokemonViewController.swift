//
//  AddPokemonViewController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class AddPokemonViewController: UIViewController, UISearchBarDelegate {
    
    var pokemon: Pokemon?
    var pokemonControl: PokemonController?
    var pokemonContrller = PokemonController()
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var savePokemonButton: UIButton! // save outlet
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        // label at load
        titleLabel.text = ""
        typesLabel.text = ""
        idLabel.text = ""
        abilityLabel.text = ""
        savePokemonButton.isHidden = true
    }
    
    // Search button was clicket
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchAPokemon = searchBar.text?.lowercased(), searchBar.text != "" else { return } // make sure its not empty
        
        
        pokemonContrller.pokemonSearch(with: searchAPokemon, completion: { (result) in
            
            do {
                let pokemon = try result.get()
                self.pokemon = pokemon
                
                DispatchQueue.main.async {
                    self.updateViews(with: pokemon)
                }
            } catch {
                NSLog("Error searching for Pokemon \(error)")
                return
            }
        })
    }
    
    //Update view
    func updateViews(with pokemon: Pokemon?) {
        
        guard let pokemon = pokemon else { return }
        
        //
        titleLabel.text = pokemon.name
        idLabel.text = String(pokemon.id)
        
        
        // Pokemon
        let pokemonType: [String] = pokemon.types.map{ $0.type.name}
        typesLabel.text = "\(pokemonType.joined(separator: ", "))"
        
        // power or ability
        let pokemonPower: [String] = pokemon.abilities.map{ $0.ability.name }
        abilityLabel.text = "\(pokemonPower.joined(separator: ", "))"
        
        //image url
        guard let url = URL(string: pokemon.sprites.frontDefault),
            let image = try? Data(contentsOf: url) else { return }
        
        
        pokemonImageView.image = UIImage(data: image)
        savePokemonButton.isHidden = false
        
        navigationItem.title = pokemon.name
        
    }
    
    // save action button
    @IBAction func savePokemonTapped(_ sender: Any) {
        guard let pokemon = pokemon else {return}
        pokemonContrller.pokemon.append(pokemon)
        navigationController?.popViewController(animated: true)
//        searchBar.text = ""
    }

}
