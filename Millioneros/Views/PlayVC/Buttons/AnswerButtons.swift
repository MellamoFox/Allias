//
//  AnswerButtons.swift
//  Millioneros
//
//  Created by VT on 09.11.2022.
//

import Foundation
import UIKit

var answerButtonsArray = [UIButton]()
let answerButtons = ["D:", "C:", "B:","D:"]

class AnswerButtons: UIButton {
    override init(frame:CGRect) {
        super.init(frame:frame)
        createButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons() {
        for i in answerButtons {
            let button = UIButton()
            button.backgroundColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 1
            button.clipsToBounds = true
            button.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
            answerButtonsArray.append(button)
            button.layer.cornerRadius = 10
            button.setTitle(i, for: .normal)
            button.setTitleColor(.white, for: .normal)
        }
    }
}
