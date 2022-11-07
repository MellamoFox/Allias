//
//  AnswerButtonCollectionView.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit

protocol SelectAnswerProtocol: AnyObject {
    func selectAnswer(indexPath: IndexPath)
}

enum IdAnswer: String {
    case idAnswerCell
}

class AnswerButtonCollectionView: UICollectionView {
    
    weak var selectAnswerDelegate: SelectAnswerProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(AnswersCollectionViewCell.self,
                 forCellWithReuseIdentifier: IdAnswer.idAnswerCell.rawValue)
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
extension AnswerButtonCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectAnswerDelegate?.selectAnswer(indexPath: indexPath)
    }
}

extension AnswerButtonCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5, height: 40)
    }
}
