//
//  AppsHeaderCell.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 8/2/23.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    static let reuseID = "AppsHeaderCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        iv.layer.borderColor = UIColor.systemGray.cgColor
        iv.layer.borderWidth = 0.5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Keeping up with friends is faster than ever"
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Facebook"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    lazy var containerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [companyLabel,titleLabel,imageView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: self.topAnchor),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
