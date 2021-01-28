//
//  CellCollectionViewCell.swift
//  Favoritos
//
//  Created by Phillippi Areias Aguiar on 1/25/21.
//

import UIKit

class CellCollectionViewCell: UICollectionViewCell {

    //MARK: - Váriáveis
    
    let corDaFonte = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let data = ["Bitcoin", "BTC", "$ 31,010.20"]

    //MARK: - Criação dos itens da célula
    
    private lazy var icone: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "teste.png")
        return view
    }()
    private lazy var labelNome: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textAlignment = .center
        label.textColor = corDaFonte
        label.text = data[0]
        return label
    }()
    private lazy var labelSigla: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = corDaFonte
        label.textAlignment = .center
        label.text = data[1]
        return label
    }()
    private lazy var labelValor: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textColor = corDaFonte
        label.textAlignment = .center
        label.text = data[2]
        return label
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        setupViewConfiguration()
    }
    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewConfiguration

extension CellCollectionViewCell: ViewConfiguration{

    func buildViewHierarchy() {
        self.addSubview(labelNome)
        self.addSubview(labelSigla)
        self.addSubview(labelValor)
        self.addSubview(icone)
    }
    func setupConstraints() {
        self.snp.makeConstraints { (make) in
            
        }
        icone.snp.makeConstraints { (make) in
            make.top.equalTo(-8)
            make.right.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        labelNome.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        labelSigla.snp.makeConstraints { (make) in
            make.top.equalTo(labelNome.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        labelValor.snp.makeConstraints { (make) in
            make.top.equalTo(labelSigla.snp.bottom).offset(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}
