//
//  PokemonTableViewController.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    var pokemonController = PokemonController()
//    var pokemonController: PokemonController?
    var pokemon: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonController.pokemon.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        let pokemon = pokemonController.pokemon[indexPath.row]
        cell.textLabel?.text = pokemon.name

        return cell
    }
    


    // To delete cell row
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pokemonController.pokemon.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    


    
    // MARK: - Navigation
    
    // Prepare for segue
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SearchPokemon" { // search
            let pokemonAddVC = segue.destination as! AddPokemonViewController
            pokemonAddVC.pokemonContrller = pokemonController
            
        } else if segue.identifier == "ShowPokemon" { // detail
            let pokemonAddVC = segue.destination as! PokemonDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            pokemonAddVC.pokemons = pokemonController.pokemon[indexPath.row]
            pokemonAddVC.pokemonController = pokemonController
        }
    }
    // ShowPokemon
    //SearchPokemon

}
