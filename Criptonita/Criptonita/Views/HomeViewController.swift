//
//  ViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import UIKit
import SnapKit
import CoreData
import AlamofireImage

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, UISearchBarDelegate {
    // MARK: - Atributes
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
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        searchBar.delegate = self
        setupViewConfiguration()
        configuraNavgationBar()
        statusBarBackgroundColor()
        configuraViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {

//        self.navigationController?.isNavigationBarHidden = true
    }
    // MARK: - Methods
    func configuraViewModel() {
        viewModel.criarDadosCelula(tableView)
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
        self.tableView.register(MoedaTableViewCell.self, forCellReuseIdentifier: "cell")
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
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayFiltrados.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = viewModel.arrayFiltrados[indexPath.row]
        return celula
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let celula = viewModel.arrayFiltrados[indexPath.row]
        viewModel.abrirDetalhes(moeda: celula.moedaDados, imagem: celula.imagemPlace.image!)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filtraCelulasMoedas(usertext: searchText)
        tableView.reloadData()
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
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(separatorView.snp.bottom)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.bottom.equalTo(view.snp.bottom).offset(60)
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
