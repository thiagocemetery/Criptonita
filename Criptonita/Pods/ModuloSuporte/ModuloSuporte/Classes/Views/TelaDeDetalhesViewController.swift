//
//  TelaDeDetalhesViewController.swift
//  Pods-TelaDeDetalhes_Example
//
//  Created by Thiago Bittencourt Coelho on 21/01/21.
//

import UIKit
import SnapKit

struct ValuesToStyle {
    var lineSeparator = 420
    var greenColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
}

class TelaDeDetalhesViewController: UIViewController {

    // MARK: - Atributes
    var viewModel:TelaDeDetalhesViewModel

    //MARK: - Header
    private lazy var headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
        return view
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "$ \(viewModel.currentValueOFCoin)"
        return label
    }()
    private lazy var centralButton: UIButton = {

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 90, height: 20))
        button.backgroundColor = UIColor(red: 0.55, green:0.59, blue:0.37, alpha: 1)
        button.setTitle(viewModel.buttonApearence(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        button.setTitle(viewModel.highlightedButtonApearence(), for: .highlighted)
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        button.addTarget(self, action: #selector(botaoCentralAcao), for: .touchUpInside)

        
        return button
    }()
    
    //MARK: - Body
    private lazy var bodyTitleLabel: UILabel = defaultLabelValues(text:"volumes negociados", fontSize: 23)
    
    private lazy var hourTitleLabel: UILabel = defaultLabelValues(text: "última hora")
    private lazy var hourValueTitleLabel: UILabel = defaultLabelValues(text: "$ \(viewModel.hourSell)")
    
    
    private lazy var monthTitleLabel: UILabel = defaultLabelValues(text: "último mês")
    private lazy var monthValueTitleLabel: UILabel = defaultLabelValues(text: "$ \(viewModel.monthSell)")
    
    
    private lazy var yearTitleLabel: UILabel = defaultLabelValues(text: "último ano")
    private lazy var yearValueTitleLabel: UILabel = defaultLabelValues(text: "$ \(viewModel.yearSell)")
    
    
    // MARK: - Constructor
    
    init(viewModel:TelaDeDetalhesViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViewConfiguration()
        self.title = "\(viewModel.initials)"
    }
    
    func defaultLabelValues(text:String, fontSize:CGFloat = 18) -> UILabel {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = text
        return label
        
    }
    @objc func botaoCentralAcao() {
        viewModel.buttonFuncionality()
        centralButton.setTitle(viewModel.buttonApearence(), for: .normal)
        UIView.transition(with: centralButton,
            duration: 1.0,
            options: [
                .transitionFlipFromTop,
                .preferredFramesPerSecond60
            ],
            animations: { self.centralButton.isHighlighted = true },
            completion: nil)
        
        centralButton.setTitle(viewModel.highlightedButtonApearence(), for: .highlighted)
    }
    
}

extension TelaDeDetalhesViewController: ViewConfiguration {

    func buildViewHierarchy() {
        
        view.addSubview(headerContainerView)
        headerContainerView.addSubview(headerTitleLabel)
        headerContainerView.addSubview(centralButton)
        
        view.addSubview(bodyTitleLabel)
        
        view.addSubview(hourTitleLabel)
        view.addSubview(hourValueTitleLabel)
        
        view.addSubview(monthTitleLabel)
        view.addSubview(monthValueTitleLabel)
        
        view.addSubview(yearTitleLabel)
        view.addSubview(yearValueTitleLabel)
        
    }
    
    func setupConstraints() {
        
        //MARK: - Header
        headerContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(320)
        }
        headerTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerContainerView).offset(130)
            make.left.equalTo(headerContainerView).offset(20)
            make.right.equalTo(headerContainerView).inset(20)
            
        }
        centralButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerContainerView).offset(200)
            make.left.equalTo(headerContainerView).offset(50)
            make.right.equalTo(headerContainerView).inset(50)
            make.height.equalTo(50)
            
        }
        
        
        //MARK: - Body
        bodyTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(340)
            make.left.equalTo(view.snp.left).offset(50)
            make.right.equalTo(view.snp.right).inset(50)
            make.height.equalTo(50)
            
        }
        

        hourTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator)
            make.left.equalTo(view.snp.left).offset(40)
            
        }
        hourValueTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator)
            make.right.equalTo(view.snp.right).inset(40)
            
        }
        
        monthTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator + 60)
            make.left.equalTo(view.snp.left).offset(40)
            
        }
        monthValueTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator + 60)
            make.right.equalTo(view.snp.right).inset(40)
            
        }
        
        yearTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator + 120)
            make.left.equalTo(view.snp.left).offset(40)
            
        }
        yearValueTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(ValuesToStyle().lineSeparator + 120)
            make.right.equalTo(view.snp.right).inset(40)
            
        }
        
    }
    func configureViews() {
        view.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1.0)
    }
    
}
