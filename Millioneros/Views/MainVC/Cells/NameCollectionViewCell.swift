//
//  NameCollectionViewCell.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import Foundation
import UIKit

class NameCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
    }
}

extension NameCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
}
