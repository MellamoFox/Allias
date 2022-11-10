//
//  PrizeCollectionViewCell.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit
class PrizeCollectionViewCell: UICollectionViewCell {
    
    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    func setupPrizeLabel(text: String) {
        prizeLabel.text = text
        addSubview(prizeLabel)
    }
    
    
    func setupNameLabel(text: String) {
        nameLabel.text = text
        addSubview(nameLabel)
    }
    
    func setConstraint() {
        
        NSLayoutConstraint.activate([
            
            prizeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 250),
            prizeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            prizeLabel.widthAnchor.constraint(equalToConstant: 80),
            prizeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 50),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        
        ])
        
    }

    func configureContentView() {
        
        contentView.backgroundColor = .blue
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
    }
}
    




