//
//  PokemonDetailViewController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController { // searchbar delegate
    
    var pokemons: Pokemon?
    var pokemonController: PokemonController?
    var pokemonContr = PokemonController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailPokemonImageView: UIImageView!
    @IBOutlet weak var detailIDLabel: UILabel!
    @IBOutlet weak var detailAbilityLabel: UILabel!
    @IBOutlet weak var detailTypesLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let pokemon = pokemons else {return}
        // at search
        detailTitleLabel.text = pokemon.name
        detailIDLabel.text = String(pokemon.id)
        
        // pokemon type
        let pokemonIdentity: [String] = pokemon.types.map{ $0.type.name}
        detailTypesLabel.text = "\(pokemonIdentity.joined(separator: ", "))"
        // pokemon power or ability
        let pokemonPower: [String] = pokemon.abilities.map{ $0.ability.name }
        detailAbilityLabel.text = "\(pokemonPower.joined(separator: ", "))"
        
        // url for image
        guard let url = URL(string: pokemon.sprites.frontDefault),
            let image = try? Data(contentsOf: url) else {return}
        
        detailPokemonImageView.image = UIImage(data: image)
    }
    

}
