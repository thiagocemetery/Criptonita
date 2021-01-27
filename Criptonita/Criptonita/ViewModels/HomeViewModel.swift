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
    var navigationController:UINavigationController!
    
    func escolherNavControl(_ navControl:UINavigationController) {
        self.navigationController = navControl
    }
    func abrirDetalhes(moeda:CriptoMoeda) {
        
        let newViewCOntroller = Detalhes(navigationController: self.navigationController)
        newViewCOntroller.abreDetalhes(initials:moeda.sigla, currentValueOFCoin: moeda.valorAtual, isFavorite: false, hourSell: moeda.vendaHora, monthSell: moeda.vendaMes, yearSell: moeda.vendaAno)
    }
    
    func getMoedas() -> [CriptoMoeda] {
        
        var arrayMoedas: [CriptoMoeda] = []
        
        for _ in 1 ... 10 {
            arrayMoedas.append(CriptoMoeda(nome: "Bitcoin", valorAtual: "31.000", sigla: "BTC", imagem: UIImage(named: "bitcoin")!, vendaHora: "12.000", vendaMes: "123.000", vendaAno: "1234000"))
        }
        return arrayMoedas
    }
}
