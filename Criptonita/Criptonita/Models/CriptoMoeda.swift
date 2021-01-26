//
//  Moeda.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 26/01/21.
//

import Foundation
import UIKit

class CriptoMoeda {
    
    var nome:String
    var valorAtual:String
    var sigla:String
    var imagem:UIImage
    var isFavorite:Bool
    
    init(nome:String, valorAtual:String, sigla:String, imagem:UIImage) {
        
        self.nome = nome
        self.valorAtual = valorAtual
        self.sigla = sigla
        self.imagem = imagem
        self.isFavorite = false
    }
}
