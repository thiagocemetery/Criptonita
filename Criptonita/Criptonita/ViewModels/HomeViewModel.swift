//
//  HomeViewModel.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 23/01/21.
//

import Foundation
import UIKit

import TelaDeDetalhes

class HomeViewModel {
    //MARK: - Atributes
    
    //MARK: - Constructor

    
    func abrirDetalhes(_ navigationController:UINavigationController) {
        
        let newViewCOntroller = Detalhes(navigationController: navigationController)
        newViewCOntroller.abreDetalhes(initials:"BTC",currentValueOFCoin: "10.000,50", isFavorite: false, hourSell: "200.000,25", monthSell: "3.000.000,0", yearSell: "10.000.000,67")
    }
}
