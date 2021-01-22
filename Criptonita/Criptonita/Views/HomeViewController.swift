//
//  ViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import UIKit
import SnapKit
import CoreData
import TelaDeDetalhes

class HomeViewController: UIViewController {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "título"
        return label
    }()
    private lazy var centralButton: UIButton = {

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 90, height: 20))
        button.backgroundColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
        button.setTitle("Abrir Detalhes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        button.addTarget(self, action: #selector(botaoCentralAcao), for: .touchUpInside)

        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
    }
    
    @objc func botaoCentralAcao() {
        guard let nc = self.navigationController else { return }
                
        let newViewCOntroller = Detalhes(navigationController: nc)
        newViewCOntroller.abreDetalhes(initials:"BTC",currentValueOFCoin: "10.000,50", isFavorite: false, hourSell: "200.000,25", monthSell: "3.000.000,0", yearSell: "10.000.000,67")
    }
}
extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(centralButton)
    }
    
    func setupConstraints() {
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(320)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerContainerView).offset(130)
            make.left.equalTo(headerContainerView).offset(20)
            make.right.equalTo(headerContainerView).inset(20)
        
        }
        centralButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(200)
            make.left.equalTo(headerView).offset(50)
            make.right.equalTo(headerView).inset(50)
            make.height.equalTo(50)
            
        }
        
    }
    
    func configureViews() {
        view.backgroundColor = .blue
    }
}
