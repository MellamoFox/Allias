//
//  HelpButtons.swift
//  Millioneros
//
//  Created by VT on 08.11.2022.
//


import Foundation
import UIKit

var buttonsArray = [UIButton]()
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
        for _ in helpButtons {
            let button = UIButton()
            button.backgroundColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 1
            button.clipsToBounds = true
            button.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
            buttonsArray.append(button)
        }
    }
}
