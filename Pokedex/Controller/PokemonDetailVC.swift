//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Marko Poikkimäki on 2018-02-02.
//  Copyright © 2018 Marko Poikkimäki. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon:Pokemon! 
    
 
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeDexidLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        pokeDexidLbl.text = "\(pokemon.pokedexId)"
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
       
        if !pokemon.weight.isEmpty {
            self.weightLbl.text = pokemon.weight
        }
        
        if !pokemon.height.isEmpty {
            self.heightLbl.text = pokemon.height
        }
        
       self.baseAttackLbl.text = pokemon.attack
       self.defenseLbl.text = pokemon.defense

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
