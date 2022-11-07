//
//  StatusLabel.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your name"
        textColor = .red
        font = UIFont(name: "Apple SD Gohic Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
