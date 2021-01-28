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
    var arrayFiltrados: [MoedaTableViewCell] = []
    
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
                self.arrayFiltrados = self.celulasMoedas
            }
            tv.reloadData()
        }
        
    }
    
    func filtraCelulasMoedas(usertext: String) {
       
        if usertext == "" {
            arrayFiltrados = celulasMoedas
        } else {
            let filtradas = celulasMoedas.filter {
                guard let searchCoin = $0.labelNome.text?.lowercased().contains(usertext.lowercased()) else { return false}
                return searchCoin
            }
            arrayFiltrados = filtradas
        }
    }
}


