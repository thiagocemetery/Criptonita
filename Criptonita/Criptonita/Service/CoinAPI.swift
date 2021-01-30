//
//  CoinAPI.swift
//  Criptonita
//
//  Created by Thiago Gasbarro Jesus on 27/01/21.
//

import Foundation
import UIKit
import Alamofire

struct APIData {
        static let urlMain: String = "https://rest.coinapi.io/v1"
        static let apiKey: String = "?apikey=FFC56E47-B89E-4FF6-98BB-06C4E5D4F279"
        static let urlAssetBTC = "\(APIData.urlMain)/assets\(APIData.apiKey)"
    }

protocol CoinAPIProtocol {

    func downloadJSON(completion: @escaping (_ coins:ModelCoin) -> Void)

}

class CoinAPI: CoinAPIProtocol {

    var coins: [ModelCoin] = []

    func downloadJSON(completion: @escaping (ModelCoin) -> Void) {
    Alamofire.request(APIData.urlAssetBTC, method: .get).responseJSON { (response) in
        switch response.result {
            case .success:
                do {
                guard let data = response.data else { return }
                let coinRecovered = try JSONDecoder().decode(ModelCoin.self, from: data)
                let filterCripto = coinRecovered.filter {$0.type_is_crypto == 1}
                let filterNil = filterCripto.filter {$0.priceUsd != nil}
                completion(filterNil) }
            catch {
                        if let errorCode = response.response?.statusCode {
                        if errorCode == 400 {
                        print("Bad Request -- There is something wrong with your request")}
                        if errorCode == 401 {
                        print("Unauthorized -- Your API key is wrong")
                            }
                        if errorCode == 403 {
                        print("Forbidden -- Your API key doesnt't have enough privileges to access this resource")
                            }
                        if errorCode == 429 {
                        print("Too many requests -- You have exceeded your API key rate limits")
                            }
                        if errorCode == 550 {
                        print("No data -- You requested specific single item that we don't have at this moment.")
                            }
                        }
                    }
                    //break
            case .failure:
                print("error 404")
            }
        }

    }

  }
