//
//  HelpButtons.swift
//  Millioneros
//
//  Created by VT on 08.11.2022.
//


import Foundation
import UIKit

var helpButtonsArray = [UIButton]()
let helpButtons = ["50/50", "Call", "Mistake","Money"]
class HelpButtons: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        createButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons() {
        for i in helpButtons {
            let button = UIButton()
            button.backgroundColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 1
            button.clipsToBounds = true
            button.layer.cornerRadius = 10
            button.titleLabel?.font = UIFont(name: "Arial Bold", size: 16)
            button.layer.borderWidth = 2
            button.layer.borderColor =  UIColor.white.cgColor
            button.setTitle(i, for: .normal)
            button.setTitleColor(.white, for: .normal)
            helpButtonsArray.append(button)
        }
    }
}
