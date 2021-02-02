//
//  MySearchBar.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 02/02/21.
//

import Foundation
import UIKit

class MySearchBar:UISearchBar {
    
    func setNewcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }
}
