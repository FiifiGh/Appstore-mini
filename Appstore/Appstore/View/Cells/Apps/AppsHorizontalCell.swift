//
//  AppsHorizontalCell.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 8/1/23.
//

import UIKit

class AppsHorizontalCell: UICollectionViewCell {
    
    static var reuseID = "AppsHorizontalCell"
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        return label
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
//        button.setTitle("GET", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        button.translatesAutoresizingMaskIntoConstraints =  false
//        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        button.layer.cornerRadius = 16
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel,companyLabel
        ])
        
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        
        let infoStackView = UIStackView(arrangedSubviews: [
            imageView,labelsStackView,getButton
        ])
        infoStackView.spacing = 16
        infoStackView.alignment = .center
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(infoStackView)
        
        
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: self.topAnchor),
            infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
