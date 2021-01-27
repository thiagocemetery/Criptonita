//
//  CelulaMoeda.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 26/01/21.
//

import Foundation
import UIKit
struct CelulaStyle {
    var fontColor:UIColor = .white
}

class CelulaMoeda:UITableViewCell {
    
    var labelNome:UILabel!
    var labelValor:UILabel!
    var labelSigla:UILabel!
    var imagemPlace:UIImageView!

    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tamanhoDaTela = UIScreen.main.bounds
        let larguraDaCelula = tamanhoDaTela.width
        let alturaDaCelula = 60
        self.imagemPlace = UIImageView(frame: CGRect(x: Int(larguraDaCelula)/15, y: 5, width: 50, height: 50))
        
        self.labelNome = UILabel(frame: CGRect(x: larguraDaCelula/4, y: 0, width: larguraDaCelula*0.3, height: CGFloat(alturaDaCelula/2)))
        self.labelNome.center.y =  CGFloat(alturaDaCelula/3)
        self.labelNome.textColor = CelulaStyle().fontColor
        self.labelNome.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        self.labelSigla = UILabel(frame: CGRect(x: larguraDaCelula/4, y: 0, width: larguraDaCelula*0.3, height: CGFloat(alturaDaCelula/2)))
        self.labelSigla.center.y =  CGFloat(alturaDaCelula/3+25)
        self.labelSigla.textColor = CelulaStyle().fontColor
        self.labelSigla.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        self.labelValor = UILabel(frame: CGRect(x: larguraDaCelula-120, y: 0, width: larguraDaCelula*0.5, height: CGFloat(alturaDaCelula/2)))
        self.labelValor.center.y = CGFloat(alturaDaCelula/2)
        self.labelValor.textColor = CelulaStyle().fontColor
        self.labelValor.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        self.addSubview(labelNome)
        self.addSubview(labelValor)
        self.addSubview(imagemPlace)
        self.addSubview(labelSigla)
        self.backgroundColor = .black
        let fundoHighlighted = UIView()
        fundoHighlighted.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView = fundoHighlighted
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
