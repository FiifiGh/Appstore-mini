//
//  BaseListCollectionViewController.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/31/23.
//

import UIKit

class BaseListCollectionViewController: UICollectionViewController {
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
