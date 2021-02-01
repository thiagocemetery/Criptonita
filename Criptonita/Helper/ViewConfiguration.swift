//
//  ViewConfiguration.swift
//  Criptonita
//
//  Created by Thiago Bittencourt Coelho on 22/01/21.
//

import Foundation

protocol ViewConfiguration: class {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() { }
}
