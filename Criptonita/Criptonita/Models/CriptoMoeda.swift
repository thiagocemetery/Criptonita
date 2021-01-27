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
    var vendaHora:String
    var vendaMes:String
    var vendaAno:String
    
    init(nome:String, valorAtual:String, sigla:String, imagem:UIImage, vendaHora:String, vendaMes:String, vendaAno:String) {
        
        self.nome = nome
        self.valorAtual = valorAtual
        self.sigla = sigla
        self.imagem = imagem
        self.isFavorite = false
        self.vendaHora = vendaHora
        self.vendaMes = vendaMes
        self.vendaAno = vendaAno
        
    }
}
