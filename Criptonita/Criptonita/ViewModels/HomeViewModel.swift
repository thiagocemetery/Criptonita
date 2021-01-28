//
//  HomeViewModel.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 23/01/21.
//

import Foundation
import UIKit	
import ModuloSuporte

class HomeViewModel {
    var navigationController:UINavigationController!
    var moedas:ModelCoin=[]
    var celulasMoedas:[MoedaTableViewCell] = []
    var tableView:UITableView!
    
    func escolherNavControl(_ navControl:UINavigationController) {
        self.navigationController = navControl
    }
    func abrirDetalhes(moeda:CriptoMoeda) {
        
        let newViewCOntroller = Detalhes(navigationController: self.navigationController)
        newViewCOntroller.abreDetalhes(initials:moeda.sigla, currentValueOFCoin: moeda.valorAtual, isFavorite: false, hourSell: moeda.vendaHora, monthSell: moeda.vendaMes, yearSell: moeda.vendaAno)
    }
    func criarDadosCelula(_ tv:UITableView){
        CoinAPI().downloadJSON { (coins) in
            
            for moeda in coins {
                self.celulasMoedas.append(MoedaTableViewCell(moeda, style: .default, reuseIdentifier: "cell"))
            }
            tv.reloadData()
        }
        
    }
    
}


