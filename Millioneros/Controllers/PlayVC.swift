//
//  PlayVC.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit

class PlayVC: UIViewController {
    
    private let questionLabel = QuestionLabel()
    private let questionBrain = QuestionBrain()
    private let gradientView = GradientView()
    private let answerButtons = AnswersCollectionViewCell()
    private let collectionView = AnswerButtonCollectionView(frame: .zero,
                                            collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [questionLabel,collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = questionBrain.getQuestion().text
        view.addSubview(gradientView)
        view.addSubview(stackView)
    }
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectAnswerDelegate = self
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600)//set after label
        ])
        NSLayoutConstraint.activate([
            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            questionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

extension PlayVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        answerButtons.answerButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdAnswer.idAnswerCell.rawValue, for: indexPath) as? AnswersCollectionViewCell
        else
        {return UICollectionViewCell()
        }
        let answerChoices = questionBrain.getQuestion().answers
        cell.answerButtonCellConfigure(answerButtonText: answerChoices[indexPath.row])
        return cell
    }
    
}

extension PlayVC: SelectAnswerProtocol {
    func selectAnswer(indexPath: IndexPath) {
        print(indexPath)
    }
}

