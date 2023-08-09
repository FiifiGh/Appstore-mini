//
//  CollectionViewCell.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/29/23.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    static var reuseID = "searchResultCell"
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints =  false
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 88).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    lazy var screenShot1 = createScreenShotImageView()
    lazy var screenShot2 = createScreenShotImageView()
    lazy var screenShot3 = createScreenShotImageView()
    
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel,categoryLabel,ratingsLabel
        ])
        labelsStackView.axis = .vertical
        
        let infoStackView = UIStackView(arrangedSubviews: [
            imageView,labelsStackView,getButton
        ])
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
            screenShot1,screenShot2,screenShot3
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.translatesAutoresizingMaskIntoConstraints = false
        screenShotStackView.axis = .horizontal
        screenShotStackView.distribution = .fillEqually
        
        
        let overrallStack = UIStackView(arrangedSubviews: [
            infoStackView,screenShotStackView
        ])
        overrallStack.axis = .vertical
        overrallStack.translatesAutoresizingMaskIntoConstraints = false
        overrallStack.spacing = 12
        
        addSubview(overrallStack)
        
        
        
        NSLayoutConstraint.activate([
            overrallStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            overrallStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            overrallStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            overrallStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
