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
    
    private let arrayUserDefaults = [51, 100, 2, 390, 548, 163, 0, 405, 809, 320, 64, 125, 250, 52, 100]
    private var arrayUserDefault: [Int]?
    
    private let validityType: String.ValidityType = .name
    private let statusLabel = StatusLabel()
    private let nameTextField = NameTextField()
    private let startButton = StartButton()
    private let rulesButton = RulesButton()
    private let scoresButton = ScoresButton()
    
    private let nameTitleAlert = "Attantion"
    private let recordTitleAlert = "Attantion"
    
    private let nameTitleMessage = "Please enter your name"
    private let recordTitleMessage = "You need to play at least one game to get some record"
    
    private var textTextField = ""
    
    
    
    private lazy var stackView = UIStackView(arrangedSubviews: [nameTextField,
                                                                startButton,
                                                                rulesButton,
                                                                scoresButton],
                                             axis: .vertical,
                                             spacing: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        
//        resetDefaults()
        
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
    
    func addStopAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(alertAction)
        present(alert, animated: false)
    }
    
   
// MARK: - Actions
    @objc private func playerMakeChoice(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        switch userChoice {
            
        case rulesButton.title(for: .normal)! :
            
            let rulesVC = RulesVC()
            navigationController?.pushViewController(rulesVC, animated: true)
            
        case startButton.title(for: .normal)! :
            
            let playVC = PlayVC()
//            let settings = Settings(name: textTextField, recordsArray: arrayUserDefault)
//            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            
            playVC.textTextField = self.textTextField
//            print(startButton.title(for: .normal)!)
            self.navigationController?.pushViewController(playVC, animated: true)
            // - temp for testinc score VC as stackView
        case scoresButton.title(for: .normal)! :
            
            let settings = UserDefaults.standard.value(Settings.self, forKey: "settings")
            if settings != nil {
                let resultVC = ResultVC()
                print(startButton.title(for: .normal)!)
                navigationController?.pushViewController(resultVC, animated: true)
            } else {

                if settings?.recordsArray == nil {
                    addStopAlert(title: recordTitleAlert, message: recordTitleMessage)
                    return
                }
                addStopAlert(title: nameTitleAlert, message: nameTitleMessage)
            }
        
        default: print("unnormal choose")
        }
    }
    
    @objc func inputTextChange() {
        
        
        
        guard let text = nameTextField.text else { return }
        print(text)
        
        textTextField = text
        print(textTextField)
        
        if text.isValid(validityType){
            startButton.setIsValid()
            scoresButton.setIsValid()
            statusLabel.textColor = .green
            statusLabel.text = "Приятно познакомиться \(text)"
        } else {
            startButton.setNotValid()
            scoresButton.setNotValid()
            statusLabel.textColor = .red
            statusLabel.text = "Пожалуйста, используйте латинские буквы и цифры"
        }
    }
    
    
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
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

