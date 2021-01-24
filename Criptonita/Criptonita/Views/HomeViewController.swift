//
//  ViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import UIKit
import SnapKit
import CoreData

class HomeViewController: UIViewController {
    
    //MARK: - Atributes
    let viewModel = HomeViewModel()
    
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = criarLabel("Moeda Digital")
    private lazy var dateLabel: UILabel = criarLabel("4 jan 2020", size: 15)
    
    private lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.barTintColor = .black
        searchBar.placeholder = "Search"
        
        searchBar.setImage(UIImage(named: "SearchIcon"), for: .search, state: .normal)
        return searchBar
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

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        configuraNavgationBar()
        statusBarBackgroundColor()
        
    }
    
    //MARK: - Methods
    
    func statusBarBackgroundColor() {
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        view.backgroundColor = UIColor.black
            
        self.view.addSubview(view)
    }
    
    func configuraNavgationBar() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    func criarLabel(_ text:String, size:CGFloat=25) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = text
        return label
    }
    @objc func botaoCentralAcao() {
        guard let nc = self.navigationController else { return }
        
        viewModel.abrirDetalhes(nc)
    }
}
extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(dateLabel)
        headerView.addSubview(searchBar)
        view.addSubview(separatorView)
        view.addSubview(centralButton)
    }
    
    func setupConstraints() {
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(180)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(40)
            make.left.equalTo(headerView).offset(20)
            make.right.equalTo(headerView).inset(20)
        
        }
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(80)
            make.left.equalTo(headerView).offset(20)
            make.right.equalTo(headerView).inset(20)
        
        }
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(120)
            make.left.equalTo(headerView).offset(20)
            make.right.equalTo(headerView).inset(20)
        
        }
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(1)
        }
        
        centralButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(300)
            make.left.equalTo(headerView).offset(50)
            make.right.equalTo(headerView).inset(50)
            make.height.equalTo(50)
            
        }
    }
    
    func configureViews() {
        view.backgroundColor = .black
    }
}
public extension UISearchBar {

    func setNewcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }
}
