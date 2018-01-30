//
//  PokeCell.swift
//  Pokedex
//
//  Created by Marko Poikkimäki on 2018-01-30.
//  Copyright © 2018 Marko Poikkimäki. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    func configureCell(pokemon : Pokemon){
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named : "\(self.pokemon.pokedexId)")
        
        
    }

}
