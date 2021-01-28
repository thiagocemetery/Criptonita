//
//  CoinModel.swift
//  Criptonita
//
//  Created by Thiago Gasbarro Jesus on 27/01/21.
//

import Foundation

// MARK: - ModelCoinElement
struct ModelCoinElement: Codable {
    let assetID, name: String?
    let type_is_crypto: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?
    let priceUsd: Double?
    let idIcon: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case type_is_crypto
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}

typealias ModelCoin = [ModelCoinElement]
