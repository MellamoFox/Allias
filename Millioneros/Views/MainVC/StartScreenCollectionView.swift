//
//  StartScreenCollectionView.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import Foundation
import UIKit

enum IdCell: String {
    case idNameCell
}

class StartScreenCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
}

