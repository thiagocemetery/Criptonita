//
//  ViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import UIKit
import SnapKit

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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
    }
}
extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).inset(20)
            make.height.equalTo(200)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(20)
            make.left.equalTo(headerView).offset(20)
            make.right.equalTo(headerView).inset(20)
        }
        
    }
    
    func configureViews() {
        view.backgroundColor = .blue
    }
}
