//
//  AgreeButton.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit

class AgreeButton: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .green
        setTitle("Я согласен", for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Bool", size: 17)
        alpha = 1
        translatesAutoresizingMaskIntoConstraints = false
    }
}
