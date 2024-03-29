//
//  ViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import UIKit
import SnapKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    
    //MARK: - Atributes
    let viewModel = HomeViewModel()
    var tableView = UITableView()
    var coins: ModelCoin = []
    
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
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor.white
        searchBar.setImage(UIImage(named: "SearchIcon"), for: .search, state: .normal)
        return searchBar
    }()
    
    private lazy var celulaItem:UILabel = criarLabel("Testando")

    private lazy var bottomTabBar:UITabBar = {
        let tabBar = UITabBar()
        tabBar.barStyle = UIBarStyle.black
        tabBar.backgroundColor = .black
        tabBar.tintColor = .black
        
        let homeTabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let favoritesTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        let itemsTabBar = [
            homeTabBarItem,
            favoritesTabBarItem
        ]

        tabBar.setItems(itemsTabBar, animated: true)
        
        return tabBar
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomTabBar.delegate = self
        configuraTableView()
        setupViewConfiguration()
        configuraNavgationBar()
        statusBarBackgroundColor()
        configuraViewModel()
        CoinAPI().downloadJSON { (coins) in
            self.coins = coins
            self.tableView.reloadData()
        }
        
    }
    
    //MARK: - Methods
    func configuraViewModel() {
        guard let navControl = self.navigationController else { return }
        viewModel.escolherNavControl(navControl)
        
    }
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
    
    func configuraTableView() {
        
        self.tableView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 400)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CelulaMoeda.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = .black
    }
    
    func criarLabel(_ text:String, size:CGFloat=25) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = text
        return label
    }
    
    //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CelulaMoeda
        let moedaAtual = coins[indexPath.row]
        
        //celula.imagemPlace.text = moedaAtual.idIcon
        celula.labelNome.text = moedaAtual.name
        celula.labelValor.text = "\(String(describing: moedaAtual.priceUsd))"
        celula.labelSigla.text = moedaAtual.assetID
        

        
        return celula
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //viewModel.abrirDetalhes(moeda: coins)
        
    }
    
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("\(item.tag)")
        if(item.tag == 0) {
            
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            
        } else {
            
        }
    }
}
extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(headerView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(dateLabel)
        headerView.addSubview(searchBar)
        view.addSubview(separatorView)
        view.addSubview(tableView)
        view.addSubview(bottomTabBar)
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
        
        bottomTabBar.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(60)
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
class ThirtyDayCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
