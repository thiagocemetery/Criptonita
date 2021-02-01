//
//  ViewConfiguration.swift
//  Favoritos
//
//  Created by Phillippi Areias Aguiar on 1/22/21.
//

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
    
    func configureViews() {
        
    }
}
