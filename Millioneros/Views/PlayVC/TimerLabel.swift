//
//  TimerLabel.swift
//  Millioneros
//
//  Created by VT on 12.11.2022.
//

import Foundation
import UIKit

class TimerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        textColor = .black
        font = UIFont(name: "Arial Bold", size: 30)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        alpha = 1
        layer.borderWidth = 10
        layer.borderColor =  UIColor.green.cgColor
        layer.cornerRadius = 40
        
        
    }
    
    
}

