//
//  AnswerButtons.swift
//  Millioneros
//
//  Created by VT on 09.11.2022.
//

import Foundation
import UIKit

var answerButtonsArray = [UIButton]()
let questionBrain = QuestionBrain()

class AnswerButtons: UIButton {
    
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        createButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func createButtons() {
         for _ in 0..<4 {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 0.9
            button.titleLabel!.adjustsFontSizeToFitWidth = true
            button.clipsToBounds = true
            answerButtonsArray.append(button)
            button.layer.cornerRadius = 10
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont(name: "Arial Bold", size: 16)
            button.layer.borderWidth = 2
            button.layer.borderColor =  UIColor.white.cgColor
            button.titleLabel?.numberOfLines = 0
        }
    }
}
