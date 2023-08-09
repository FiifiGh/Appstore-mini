//
//  AppsController.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/31/23.
//

import UIKit

class AppsController: BaseListCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var topFreeApps: AppGroup?
    var topPaidApps: AppGroup?
    var socialApps: [SocialApp]?
    
    var allApps =  [AppGroup?](){
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        aiv.backgroundColor = .white
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(AppsCell.self, forCellWithReuseIdentifier: AppsCell.reuseID)
        
        self.collectionView.register(AppsControllerHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsControllerHeaderCell.reuseID)
        
        
        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: self.view.topAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
        ])
        
        fetchData()
    }
    
    
//    MARK: - NETWORKING
    fileprivate func fetchData(){
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchFreeApps { data, error in
            dispatchGroup.leave()
            if let error = error {
                print(error)
            }
            
            self.topFreeApps = data

        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidApps { data, error in
            dispatchGroup.leave()
            
            if let error = error {
                print(error)
            }
            
            self.topPaidApps = data
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { data, error in
            dispatchGroup.leave()
            
            if let error = error {
                print(error)
            }
            
            self.socialApps = data
        }
        
        
        dispatchGroup.notify(queue: .main) {
            self.allApps.append(self.topFreeApps)
            self.allApps.append(self.topPaidApps)
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsControllerHeaderCell.reuseID, for: indexPath) as! AppsControllerHeaderCell
        cell.childController.socialApps = self.socialApps ?? [SocialApp]()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.reuseID, for: indexPath) as! AppsCell
        
        let appData = allApps[indexPath.item]
        cell.appSectionLabel.text = appData?.feed.title
        cell.childViewController.appGroups = appData
        cell.childViewController.collectionView.reloadData()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
