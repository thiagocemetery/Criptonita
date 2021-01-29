//
//  FavoritosViewController.swift
//  Pods-Favoritos_Example
//
//  Created by Phillippi Areias Aguiar on 1/22/21.
//

import UIKit
import SnapKit

public class FavoritosViewController: UIViewController {
    //MARK: - atributes
    var defaults = UserDefaults.standard
    var viewModel = FavoritosViewModel()
    
    //MARK: - Criando a tela
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Criptonita"
        return label
    }()
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "22 jan 2021"
        return label
    }()
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CellCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    //MARK: - LifeCycle Method

    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        if let celulas = UserDefaults.standard.value(forKey: "celulas") {
            print(celulas)
        } else {
            print("Vazio")
        }

    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
    }
    
    
    
}

//MARK: - ViewConfiguration

extension FavoritosViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(labelDate)
        view.addSubview(lineView)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(135)
        }
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(40)
            make.left.equalTo(containerView).offset(0)
            make.right.equalTo(containerView).inset(0)
        }
        labelDate.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.left.equalTo(containerView).offset(0)
            make.right.equalTo(containerView).inset(0)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(1)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
            make.bottom.equalTo(view.snp.bottom).inset(60)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .clear
    }
}
    //MARK: - Configuração CollectionView

extension FavoritosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-40, height: 130) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
     }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let favoritos  = defaults.value(forKey: "favoritos") as? [String] else { return 0 }
        
        return favoritos.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionViewCell
        
        return cell
    
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let nc = self.navigationController else {return}

        let vcDetails = Detalhes(navigationController: nc)
        vcDetails.abreDetalhes(initials: "BTC", currentValueOFCoin: 31010.20, isFavorite: false, hourSell: 310010.20, daySell: 1310010.20, monthSell: 100310010.20, image: UIImage())
        nc.isNavigationBarHidden = false
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
    }
}
