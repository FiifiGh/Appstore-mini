//
//  AppsControllerHeaderCell.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 8/1/23.
//

import UIKit

class AppsControllerHeaderCell: UICollectionReusableView {
    
    let childController = AppsHeaderController()
    
    static let reuseID = "appsControllerHeaderCell"
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        childController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(childController.view)
        
        NSLayoutConstraint.activate([
            childController.view.topAnchor.constraint(equalTo: self.topAnchor),
            childController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            childController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

