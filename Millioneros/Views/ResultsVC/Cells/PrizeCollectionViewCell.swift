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
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(text: String) {
        
        prizeLabel.text = text
      
        contentView.backgroundColor = .blue
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        addSubview(prizeLabel)
    }
    
}

extension PrizeCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            prizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            prizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
