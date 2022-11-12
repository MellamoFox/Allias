//
//MARK - NEw Ficha test
//  ViewController.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//

import UIKit

class WelcomeVC: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let startScreenSound = "startScreenSound"
    private let validityType: String.ValidityType = .name
    private let statusLabel = StatusLabel()
    private let nameTextField = NameTextField()
    private let startButton = StartButton()
    private let rulesButton = RulesButton()
    private let scoresButton = ScoresButton()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [nameTextField,
                                                startButton,
                                                rulesButton,
                                                scoresButton],
                                axis: .vertical,
                                spacing: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(resource: startScreenSound)
        setupViews()
        setConstraints()

    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        view.addSubview(statusLabel)
        startButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        scoresButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        nameTextField.addTarget(self, action: #selector(inputTextChange), for: .editingChanged)
    }
    
    @objc private func playerMakeChoice(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        switch userChoice {
        case rulesButton.title(for: .normal)! :
            let rulesVC = RulesVC()
            navigationController?.pushViewController(rulesVC, animated: true)
        case startButton.title(for: .normal)! :
            player.stop()
            let playVC = PlayVC()
            print(startButton.title(for: .normal)!)
            self.navigationController?.pushViewController(playVC, animated: true)
//MARK: - temp for testinc score VC as stackView
        case scoresButton.title(for: .normal)! :
            let resultVC = ScoresVC()
            print(startButton.title(for: .normal)!)
            navigationController?.pushViewController(resultVC, animated: true)
        default: print("unnormal choose")
        }
    }
    @objc func inputTextChange() {
        guard let text = nameTextField.text else { return }
        print(text)
            if text.isValid(validityType){
                startButton.setIsValid()
                statusLabel.textColor = .green
                statusLabel.text = "Приятно познакомиться \(text)"
            } else {
                startButton.setNotValid()
                statusLabel.textColor = .red
                statusLabel.text = "Пожалуйста, используйте латинские буквы и цифры"
            }
    }
}

//MARK: - SetConstraints

extension WelcomeVC {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -20),
            statusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
        ])
    }
}
 
