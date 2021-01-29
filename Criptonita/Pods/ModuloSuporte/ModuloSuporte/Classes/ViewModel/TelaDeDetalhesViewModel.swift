//
//  TelaDeDetalhesViewModel.swift
//  Pods-TelaDeDetalhes_Example
//
//  Created by Thiago Bittencourt Coelho on 21/01/21.
//

import Foundation
import UIKit

public class TelaDeDetalhesViewModel {
    let defaults = UserDefaults.standard
    
    var initials:String
    var currentValueOFCoin:Double
    var isFavorite:Bool
    var hourSell:Double
    var monthSell:Double
    var yearSell:Double
    var favoritos:[String]
    
    init(_ initials:String, _ currentValueOFCoin:Double,_ isFavorite:Bool,_ hourSell:Double,_ monthSell:Double,_ yearSell:Double, _ image:UIImage) {
        self.currentValueOFCoin = currentValueOFCoin
        self.isFavorite = isFavorite
        self.monthSell = monthSell
        self.hourSell = hourSell
        self.yearSell = yearSell
        self.initials = initials
        if let favoritos = defaults.value(forKey: "favoritos") as? [String] {
            self.favoritos = favoritos
            if favoritos.contains(initials) {
                self.isFavorite = true
            }
            
        } else {
            self.favoritos = []
        }
        
        
    }
    
    func buttonApearence() -> String {
        let apearence = !isFavorite ? "ADICIONAR": "REMOVER"
        
        return apearence
    }
    
    func highlightedButtonApearence() -> String {
        
        let apearence = !isFavorite ? "ADICIONADO! ✅": "REMOVIDO! ❌"
    
        
        return apearence
        
    }
    
    @objc func buttonFuncionality() {
        if (isFavorite) {
            isFavorite = !isFavorite
            favoritos = favoritos.filter(){$0 != initials}
            
            defaults.setValue(favoritos, forKey: "favoritos")
            
            print("Remove")
        } else {
            print("Adiciona")
            
            favoritos.append(initials)
            
            defaults.setValue(favoritos, forKey: "favoritos")
            isFavorite = !isFavorite
        }
    }
    
}
