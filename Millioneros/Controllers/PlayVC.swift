//
//  PlayVC.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import Foundation
import UIKit

class PlayVC: UIViewController {
    
    private let setTimer = TimerSetUp()
    private let helpButtons = HelpButtons()
    private let questionLabel = QuestionLabel()
    private let questionBrain = QuestionBrain()
    private let gradientView = GradientView()
    private let answerButtons = AnswersCollectionViewCell()
    private let collectionView = AnswerButtonCollectionView(frame: .zero,
                                            collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [questionLabel,collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    private lazy var stackView2 = UIStackView(arrangedSubviews: [buttonsArray[0],
                                                buttonsArray[1],
                                                buttonsArray[2],
                                                buttonsArray[3]],
                                             axis: .horizontal,
                                              spacing: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setDelegates()
        view.backgroundColor = .lightGray
        
    }
    
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = questionBrain.getQuestion().text
        //view.addSubview(gradientView)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(setTimer)
    }
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectAnswerDelegate = self
    }
    private func setConstraints(){
        /*NSLayoutConstraint.activate([
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
        ])*/
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            stackView2.bottomAnchor.constraint(equalTo: questionLabel.topAnchor,constant: -400),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
       
        NSLayoutConstraint.activate([
            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            questionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
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

