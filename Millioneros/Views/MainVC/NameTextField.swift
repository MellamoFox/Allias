//
//  NameTextField.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import Foundation
import UIKit


class NameTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 15,
                                        height: frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Представьтесь"
        font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        tintColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
