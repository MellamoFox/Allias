//
//  PrizeCollectionViewCell.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit
class PrizeCollectionViewCell: UICollectionViewCell {
    
    let resultsButtons = ["0","100","200","300","500","1000","2000","4000","8000","32 000","64 000","125 000","250 000","500 000","1 000 000"]
    
    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        addSubview(prizeLabel)
    }
}

extension PrizeCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            prizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            prizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
