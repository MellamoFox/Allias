//
//  AnswersCollectionViewCell.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit
class AnswersCollectionViewCell: UICollectionViewCell {
    
    let answerButtons = ["A:","B:","C:","D:"]
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
        contentView.alpha = 0.3
        contentView.layer.cornerRadius = 10

        addSubview(answerLabel)
    }
    
    private func configure(answerButtonText:String) {
        answerLabel.text = answerButtonText
    }
    public func answerButtonCellConfigure(answerButtonText: String) {
        configure(answerButtonText: answerButtonText)
    }
}

extension AnswersCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            answerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
