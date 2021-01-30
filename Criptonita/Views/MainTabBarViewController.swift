//
//  TabBarViewController.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 28/01/21.
//

import UIKit
import ModuloSuporte

class MainTabBarViewController: UITabBarController {

    //MARK: - Constructor
    init() {
        super.init(nibName: "MainTabBarViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarTabBar()
    }
    func configurarTabBar() {
        let vc1 = HomeViewController()
        let vc2 = FavoritosViewController()
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(named: "star_icon"), tag: 2)

        viewControllers = [nc1, nc2]
        setViewControllers(viewControllers, animated: true)
        // backGround for tapBarView
        tabBar.barTintColor = .black
        tabBar.frame.size.height = 60
    }

}
