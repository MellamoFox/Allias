//
//  GoOneButton.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit

class GoOneButton: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .yellow
        setTitle("Продолжить", for: .normal)
        setTitleColor(.green, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Bool", size: 17)
        alpha = 1
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
