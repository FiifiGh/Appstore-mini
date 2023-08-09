//
//  AppsCell.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/31/23.
//

import UIKit

class AppsCell: UICollectionViewCell {
    
    static let reuseID = "AppsCell"
    let childViewController = HorizontalAppsController()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(appSectionLabel)
    
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(childViewController.view)
        

        NSLayoutConstraint.activate([
            appSectionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            appSectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            appSectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            childViewController.view.topAnchor.constraint(equalTo: appSectionLabel.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var appSectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App Section"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
}
