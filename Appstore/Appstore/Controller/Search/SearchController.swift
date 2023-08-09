//
//  AppsSearchController.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/29/23.
//

import UIKit
import SDWebImage

class SearchController: BaseListCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var timer: Timer?
    
    fileprivate var appSearch: [Result] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.reuseID)
        fetchJsonRequest()
        setupSearchBar()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseID, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = appSearch[indexPath.item].trackName
        cell.categoryLabel.text = appSearch[indexPath.item].primaryGenreName
        
        if let url = URL(string: appSearch[indexPath.item].artworkUrl100){
            cell.imageView.sd_setImage(with: url)
        }
        
        appSearch[indexPath.item].screenshotUrls.enumerated().forEach { index,element in
            guard let url = URL(string: element) else {
                return
            }
            
            if index == 0 {
                cell.screenShot1.sd_setImage(with: url)
            }else if index == 1 {
                cell.screenShot2.sd_setImage(with: url)
            }else if index == 2 {
                cell.screenShot3.sd_setImage(with: url)
            }
        }
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appSearch.count
    }
    
    
    //MARK: - NETWORK REQUEST
    
    fileprivate func fetchJsonRequest(){
        Service.shared.fetchAppSearch { result, error in
            
            if let error = error {
                print("Failed ",error )
                return
            }
            
            guard let result = result else { return }
            self.appSearch = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
          
            
            
        }
    }
}
//MARK: - SEARCH BAR CONFIG
extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Service.shared.fetchAppSearch(searchItem: searchText) { result, error in
                
                if let error = error {
                    print("Failed ",error )
                    return
                }
                
                guard let result = result else { return }
                self.appSearch = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
 
            }
        })
    }
    
    fileprivate func setupSearchBar(){
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}
