//
//  TelaDeDetalhesViewModel.swift
//  Pods-TelaDeDetalhes_Example
//
//  Created by Thiago Bittencourt Coelho on 21/01/21.
//

import Foundation

public class TelaDeDetalhesViewModel {
    
    var initials:String
    var currentValueOFCoin:Double
    var isFavorite:Bool
    var hourSell:Double
    var monthSell:Double
    var yearSell:Double
    
    init(_ initials:String, _ currentValueOFCoin:Double,_ isFavorite:Bool,_ hourSell:Double,_ monthSell:Double,_ yearSell:Double, _ image:UIImage) {
        self.currentValueOFCoin = currentValueOFCoin
        self.isFavorite = isFavorite
        self.monthSell = monthSell
        self.hourSell = hourSell
        self.yearSell = yearSell
        self.initials = initials
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
            print("Remove")
        } else {
            print("Adiciona")
            isFavorite = !isFavorite
        }
    }
    
}
