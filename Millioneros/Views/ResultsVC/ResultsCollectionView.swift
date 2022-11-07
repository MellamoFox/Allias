//
//  ResultsCollectionView.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit

protocol SelectPrizeProtocol: AnyObject {
    func selectPrize(indexPath: IndexPath)
}

enum IdPrize: String {
    case idPrizeCell
}

class ResultsCollectionView: UICollectionView {
    
    weak var selectPrizeDelegate: SelectPrizeProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(PrizeCollectionViewCell.self,
                 forCellWithReuseIdentifier: IdPrize.idPrizeCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        delegate = self
    }
}

//MARK: - UICollectionViewDelegate
extension ResultsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectPrizeDelegate?.selectPrize(indexPath: indexPath)
    }
}

extension ResultsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 20)
    }
}
