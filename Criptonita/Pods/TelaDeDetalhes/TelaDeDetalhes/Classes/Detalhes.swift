import UIKit

public class Detalhes {
    var nc:UINavigationController
    
    public init(navigationController:UINavigationController) {
        self.nc = navigationController
        
    }
    public func abreDetalhes(initials:String,currentValueOFCoin:String, isFavorite:Bool, hourSell:String, monthSell:String, yearSell:String) {
    
        let viewModel = TelaDeDetalhesViewModel(initials, currentValueOFCoin, isFavorite, hourSell, monthSell, yearSell)
        let tela = TelaDeDetalhesViewController(viewModel: viewModel)
        
        if #available(iOS 10.0, *) {
            nc.navigationBar.barTintColor = UIColor(displayP3Red: 0.55, green:0.59, blue:0.37, alpha: 1)
            nc.navigationBar.tintColor = .white
            nc.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            nc.navigationBar.shadowImage = UIImage()
            let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
            nc.navigationBar.titleTextAttributes = textAttributes
            
        } else {
            // Fallback on earlier versions
        }
        nc.pushViewController(tela, animated: true)
        
    }
}
