//
//  PlayVC.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import UIKit

class PlayVC: UIViewController {
    
    private let setTimer = TimerSetUp()
    private let helpButtons = HelpButtons()
    private let answerButtons = AnswerButtons()
    private let questionLabel = QuestionLabel()
    private let questionBrain = QuestionBrain()
    private let gradientView = GradientView()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [answerButtonsArray[0],answerButtonsArray[1]],
                                             axis: .vertical,
                                             spacing: 20)
    private lazy var stackView2 = UIStackView(arrangedSubviews: [answerButtonsArray[2],answerButtonsArray[3]],
                                             axis: .vertical,
                                             spacing: 20)
    private lazy var stackView3 = UIStackView(arrangedSubviews: helpButtonsArray,
                                             axis: .horizontal,
                                             spacing: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        questionLabel.animation(typing: questionBrain.getQuestion().text, duration: 0.05)
    }
    
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        view.addSubview(setTimer)
        view.addSubview(questionLabel)
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView2.alignment = .fill
        stackView2.distribution = .fillEqually
        stackView3.alignment = .fill
        stackView3.distribution = .fillEqually
        setTimer.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = ""
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        NSLayoutConstraint.activate([
            setTimer.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            setTimer.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor,constant: -50)
         
        ])
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 120),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45)
        ])
        NSLayoutConstraint.activate([
            stackView2.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView2.heightAnchor.constraint(equalToConstant: 120),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            stackView2.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20)
   
        ])
        NSLayoutConstraint.activate([
            questionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -20),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            questionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            stackView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            stackView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            stackView3.heightAnchor.constraint(equalToConstant: 100),
            stackView3.widthAnchor.constraint(equalToConstant: 100)

        ])
    }
}





