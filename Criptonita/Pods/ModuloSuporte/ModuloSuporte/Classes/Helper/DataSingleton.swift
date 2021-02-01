//
//  DataSingleton.swift
//  ModuloSuporte
//
//  Created by Thiago Bittencourt Coelho on 29/01/21.
//

import Foundation

public class DataSingleton {
    var favViewController:FavoritosViewController
    
    public init(favViewController:FavoritosViewController) {
        self.favViewController = favViewController
    }
    
    public func enviaDados(dados:[[String:Any]]) {
        
        favViewController.dados = dados
        
    }
    
}
