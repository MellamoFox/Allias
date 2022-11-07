//////////
//  RulesTextLabel.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit


class RulesTextLabel :UILabel {
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        text = "Для того, чтобы заработать 1 миллион рублей, необходимо правильно ответить на 15 вопросов из различных областей знаний. Каждый вопрос имеет 4 варианта ответа, из которых только один является верным. Каждый вопрос имеет конкретную стоимость. Все суммы являются заменяемыми, то есть после ответа на следующий вопрос не суммируются с суммой за ответ на предыдущий. Cуммы, полученные при верном ответе на 5-й и 10-й вопросы - несгораемы. После правильного ответа на вопрос игрок может остановиться и забрать деньги"
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
