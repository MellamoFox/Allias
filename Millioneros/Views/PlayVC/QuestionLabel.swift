//
//  QuestionLabel.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit

class QuestionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        textColor = .white
        font = UIFont(name: "Arial Bold", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        layer.cornerRadius = 10
        textAlignment = .center
        alpha = 0.9
        text = ""
        numberOfLines = 0
        layer.borderWidth = 2
        layer.borderColor =  UIColor.white.cgColor
    

    }
    
}
extension UILabel {
    func animation(typing value: String, duration: Double){
        for char in value {
            self.text?.append(char)
            RunLoop.current.run(until: Date() + duration)
        }
    }
}

