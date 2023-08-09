//
//  HorizontalAppsController.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/31/23.
//

import UIKit

class HorizontalAppsController: BaseListCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var appGroups: AppGroup? 
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(AppsHorizontalCell.self, forCellWithReuseIdentifier: AppsHorizontalCell.reuseID)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.collectionView.collectionViewLayout =  layout
        
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups?.feed.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHorizontalCell.reuseID, for: indexPath) as! AppsHorizontalCell
        cell.nameLabel.text = appGroups?.feed.results[indexPath.item].name
        cell.companyLabel.text = appGroups?.feed.results[indexPath.item].artistName
        cell.imageView.sd_setImage(with: URL(string: appGroups?.feed.results[indexPath.item].artworkUrl100 ?? ""))
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = (self.view.frame.height - 44) / 3
        let width = (self.view.frame.width - (self.view.frame.width * 0.1))
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }

}
