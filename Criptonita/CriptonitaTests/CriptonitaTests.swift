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

}
