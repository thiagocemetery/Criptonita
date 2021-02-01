//
//  CriptonitaTests.swift
//  CriptonitaTests
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import XCTest
@testable import Criptonita

class CriptonitaTests: XCTestCase {

    let homeViewModel:HomeViewModel = HomeViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

//    func filtraCelulasMoedas(usertext: String) {
//        if usertext == "" {
//            arrayFiltrados = celulasMoedas
//        } else {
//            let filtradas = celulasMoedas.filter {
//                guard let searchCoin = $0.labelNome.text?.lowercased().contains(usertext.lowercased()) else { return false}
//                return searchCoin
//            }
//            arrayFiltrados = filtradas
//        }
//    }
    func testVerificaSeBuscaEstaRetornandoArrayCerto() {
        let busca = "Bit"
        
        homeViewModel.filtraCelulasMoedas(usertext: busca)
        
        for moeda in homeViewModel.arrayFiltrados {
            
            XCTAssertEqual(true, moeda.labelNome.text?.contains(busca))
            
        }
        
    }

}
