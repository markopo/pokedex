//
//  Pokemon.swift
//  Pokedex
//
//  Created by Marko Poikkimäki on 2018-01-30.
//  Copyright © 2018 Marko Poikkimäki. All rights reserved.
//

import Foundation
import Alamofire


class Pokemon {
    
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _defense:String!
    private var _height:String!
    private var _weight:String!
    private var _attack:String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    
    var name: String {
        
        if _name == nil {
            _name = ""
        }
        
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        
        if _description == nil {
            _description = ""
        }
        
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            _type = ""
        }
        
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            _defense = ""
        }
        
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            _height = ""
        }
        
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
    }
    
    var attack: String {
        
        if _attack == nil {
            _attack = ""
        }
        
        return _attack
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        
        return _nextEvolutionTxt
    }
    
    init(name:String, pokedexId:Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = self.getURL()
    }
    
    func getURL() -> String {
        let pokeId = self._pokedexId!
        return "\(URL_BASE)\(URL_POKEMON)\(pokeId)"
    }
    
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        
        Alamofire.request(self._pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                
                print("print: w:\(self._weight) h:\(self._height)")
                completed()
            }
        }
        
       
    }
    
}
