//
//  CriptonitaTests.swift
//  CriptonitaTests
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import XCTest
@testable import Criptonita

class CriptonitaTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testModel() {
        let coin = ModelCoinElement(assetID: "BTC", name: "Bitcoin", type_is_crypto: 1, volume1HrsUsd: 0.0, volume1DayUsd: 0.0, volume1MthUsd: 0.0, priceUsd: 0.0, idIcon: "imagem.png")
        
        XCTAssertEqual(coin.assetID, "BTC")
        XCTAssertEqual(coin.name, "Bitcoin")
        XCTAssertEqual(coin.type_is_crypto, 1)
        XCTAssertEqual(coin.volume1HrsUsd, 0.0)
        XCTAssertEqual(coin.volume1DayUsd, 0.0)
        XCTAssertEqual(coin.volume1MthUsd, 0.0)
        XCTAssertEqual(coin.priceUsd, 0.0)
        XCTAssertEqual(coin.idIcon, "imagem.png")
        XCTAssertNotNil(coin)
    }
    var labelNome: UILabel!
    var labelValor: UILabel!
    var labelSigla: UILabel!
    var imagemPlace: UIImageView!
    
    func testDadosConfiguracao() {
        let coin = ModelCoinElement(assetID: "BTC", name: "Bitcoin", type_is_crypto: 1, volume1HrsUsd: 0.0, volume1DayUsd: 0.0, volume1MthUsd: 0.0, priceUsd: 0.0, idIcon: "imagem.png")
        let cell = MoedaTableViewCell(coin, style: .default, reuseIdentifier: "cell")
        cell.dadosConfiguracao(coin)
        XCTAssertEqual(cell.labelNome.text, "Bitcoin")
        XCTAssertEqual(cell.labelValor.text, "$ 0.000")
        XCTAssertEqual(cell.labelSigla.text, "BTC")
        XCTAssertNotNil(coin)
    }
    func testVerificaSeAbreNavigationControllerSelecionado() {
        let homeViewModel = HomeViewModel()
        let navControll = UINavigationController()
        homeViewModel.escolherNavControl(navControll)
        XCTAssertEqual(homeViewModel.navigationController, navControll)
        
    }
    func testVariaveisDeAbrirDetalhes() {

        
    }
}
