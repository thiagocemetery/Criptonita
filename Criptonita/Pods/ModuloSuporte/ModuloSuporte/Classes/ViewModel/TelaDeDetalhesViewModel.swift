//
//  TelaDeDetalhesViewModel.swift
//  Pods-TelaDeDetalhes_Example
//
//  Created by Thiago Bittencourt Coelho on 21/01/21.
//

import Foundation

public class TelaDeDetalhesViewModel {
    
    var initials:String
    var currentValueOFCoin:String
    var isFavorite:Bool
    var hourSell:String
    var monthSell:String
    var yearSell:String
    
    init(_ initials:String, _ currentValueOFCoin:String,_ isFavorite:Bool,_ hourSell:String,_ monthSell:String,_ yearSell:String) {
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
