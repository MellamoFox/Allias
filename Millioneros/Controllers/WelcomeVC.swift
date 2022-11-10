//
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
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        view.addSubview(statusLabel)
        startButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        scoresButton.addTarget(self, action: #selector(playerMakeChoice), for: .touchUpInside)
        
    }
    
    private func setDelegates() {
        nameTextField.textFieldDelegate = self
    }
    @objc private func playerMakeChoice(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        switch userChoice {
        case rulesButton.title(for: .normal)! :
            let rulesVC = RulesVC()
            print(rulesButton.title(for: .normal)!)
            navigationController?.pushViewController(rulesVC, animated: true)
        case startButton.title(for: .normal)! :
            let playVC = PlayVC()
            print(startButton.title(for: .normal)!)
            navigationController?.pushViewController(playVC, animated: true)
//MARK: - temp for testinc score VC as stackView
        case scoresButton.title(for: .normal)! :
            let resultVC = ScoresVC()
            print(startButton.title(for: .normal)!)
            navigationController?.pushViewController(resultVC, animated: true)
        default: print("unnormal choose")
        }
    }
    
}

//MARK: - UICollectionViewDataSource

extension WelcomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idNameCell.rawValue, for: indexPath ) as? NameCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        return cell
    }
    
}


//MARK: -

extension WelcomeVC: ActionsNameTextFieldProtocol {
    func typingText(text: String) {
        print(text)
    }
    
    func cleanOutTextField() {
        print("clear")
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
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -20),
            statusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

        ])
    }
}
 
