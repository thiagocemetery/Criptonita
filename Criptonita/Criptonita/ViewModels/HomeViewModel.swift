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
    var navigationController: UINavigationController = UINavigationController()
    var moedas:ModelCoin = []
    var celulasMoedas:[MoedaTableViewCell] = []
    var tableView: UITableView!
    var arrayFiltrados: [MoedaTableViewCell] = []
    func escolherNavControl(_ navControl: UINavigationController) {
        self.navigationController = navControl
    }
    func abrirDetalhes(moeda:ModelCoinElement, imagem: UIImage) {
        let newViewCOntroller = Detalhes(navigationController: self.navigationController)
        guard let initials = moeda.assetID else { return }
        guard let currentValueOFCoin = moeda.priceUsd else { return }
        guard let hourSell = moeda.volume1HrsUsd else { return }
        guard let monthSell = moeda.volume1DayUsd else { return }
        guard let yearSell = moeda.volume1MthUsd else { return }
        newViewCOntroller.abreDetalhes(initials: initials, currentValueOFCoin: currentValueOFCoin, isFavorite: false, hourSell: hourSell, daySell: monthSell, monthSell: yearSell, image: imagem)
    }
    func criarDadosCelula(_ tv: UITableView) {
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
