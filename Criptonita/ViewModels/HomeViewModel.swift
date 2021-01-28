//
//  HomeViewModel.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 23/01/21.
//

import Foundation
import UIKit	
//import TelaDeDetalhes

class HomeViewModel {
    var navigationController:UINavigationController!
    
    func escolherNavControl(_ navControl:UINavigationController) {
        self.navigationController = navControl
    }
    func abrirDetalhes(moeda:CriptoMoeda) {
//        
//        let newViewCOntroller = Detalhes(navigationController: self.navigationController)
//        newViewCOntroller.abreDetalhes(initials:moeda.sigla, currentValueOFCoin: moeda.valorAtual, isFavorite: false, hourSell: moeda.vendaHora, monthSell: moeda.vendaMes, yearSell: moeda.vendaAno)
    }
}


