//
//  ScoresButton.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import Foundation
import UIKit

class ScoresButton: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .blue
        setTitle("Рейтинг", for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Bool", size: 17)
        alpha = 0.9
        translatesAutoresizingMaskIntoConstraints = false
    }
}
