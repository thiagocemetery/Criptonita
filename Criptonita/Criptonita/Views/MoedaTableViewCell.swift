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

class MoedaTableViewCell:UITableViewCell {
    var labelNome: UILabel!
    var labelValor: UILabel!
    var labelSigla: UILabel!
    var imagemPlace: UIImageView!
    var moedaDados:ModelCoinElement!
    init(_ moeda:ModelCoinElement, style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        celulaStyle()
        dadosConfiguracao(moeda)
        self.moedaDados = moeda
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func celulaStyle() {
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
        self.addSubview(labelSigla)
        self.addSubview(imagemPlace)
        self.backgroundColor = .black
        let fundoHighlighted = UIView()
        fundoHighlighted.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView = fundoHighlighted
        }
    func dadosConfiguracao(_ moeda:ModelCoinElement) {
        if let nome = moeda.name {
            self.labelNome.text = nome
        } else {
            self.labelNome.text = "-----"
        }
        if let sigla = moeda.assetID {
            self.labelSigla.text = sigla
        } else {
            self.labelSigla.text = "---"
        }
        if let value = moeda.priceUsd {
            self.labelValor.text = String(format: "$ %.3f", value)
        } else {
            self.labelValor.text = "0"
        }
        if let idCoinIcon = moeda.idIcon {
            let iconUrl = idCoinIcon.replacingOccurrences(of: "-", with: "")
            if let recoveredUrl = URL(string: "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_32/\(iconUrl).png") {
                self.imagemPlace.af_setImage(withURL: recoveredUrl, placeholderImage: UIImage(named: "coins_icon"))
        }
        } else {
            self.imagemPlace.image = UIImage(named: "coins_icon")
    }
    }
    }
