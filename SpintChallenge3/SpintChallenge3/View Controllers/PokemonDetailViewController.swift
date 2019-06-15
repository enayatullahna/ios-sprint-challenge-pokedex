//
//  PokemonDetailViewController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemons: Pokemon?
    var pokemonController: PokemonController?
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
