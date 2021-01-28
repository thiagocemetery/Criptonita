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
        static let urlAssetBTC = "\(APIData.urlMain)/exchanges\(APIData.apiKey)"
    }

protocol CoinAPIProtocol {

    func downloadJSON(completion: @escaping (_ coins:ModelCoin) -> Void)

}

class CoinAPI: CoinAPIProtocol {

    var coins: [ModelCoin] = []


    func downloadJSON(completion: @escaping (ModelCoin) -> Void){
        
        guard let url = URL(string: "https://rest.coinapi.io/v1/exchanges?apikey=FFC56E47-B89E-4FF6-98BB-06C4E5D4F279") else {return}

        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            switch response.result{
                case .success:
                    do {
                        let coinRecovered = try JSONDecoder().decode(ModelCoin.self, from: response.data!)
                        print(coinRecovered)
                    }
                    catch {
                        if let errorCode = response.response?.statusCode {
                            if errorCode == 400 {
                            print("error 400")}
                            
                            if errorCode == 401 {
                                print("error 401")
                            }
                        }
      
                    }
                    break
            
            case .failure:
                print("error 404")
               
                }
        }

    }

  }

