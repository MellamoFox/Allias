//
//  RulesVC.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit

class RulesVC: UIViewController {
    
    
    private let agreeButton = AgreeButton()
    private let rulesText = RulesTextLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            agreeButton.heightAnchor.constraint(equalToConstant: 50),
            agreeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            agreeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            agreeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            
        ])
        NSLayoutConstraint.activate([
            rulesText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rulesText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesText.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
            rulesText.bottomAnchor.constraint(equalTo: agreeButton.topAnchor)
        ])
    }
    
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(agreeButton)
        view.addSubview(rulesText)
        agreeButton.addTarget(self, action: #selector(agreeButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func agreeButtonTapped(_ sender: UIButton) {
        let welcomeVC = WelcomeVC()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
