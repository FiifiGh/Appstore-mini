//
//  AppsHeaderController.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 8/1/23.
//

import UIKit

class AppsHeaderController: BaseListCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var socialApps = [SocialApp]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: AppsHeaderCell.reuseID)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = layout
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderCell.reuseID, for: indexPath) as! AppsHeaderCell
        cell.companyLabel.text = socialApps[indexPath.item].name
        cell.titleLabel.text = socialApps[indexPath.item].tagline
        cell.imageView.sd_setImage(with: URL(string: socialApps[indexPath.item].imageUrl))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - (self.view.frame.width * 0.1))
        return .init(width: width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }
    
}
