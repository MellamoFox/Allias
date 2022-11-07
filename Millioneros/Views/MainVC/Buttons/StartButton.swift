//
//  StartButton.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import Foundation
import UIKit

class StartButton: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .yellow
        setTitle("Начать игру", for: .normal)
        setTitleColor(.green, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Bool", size: 17)
        alpha = 0.9
        translatesAutoresizingMaskIntoConstraints = false
    }
}
