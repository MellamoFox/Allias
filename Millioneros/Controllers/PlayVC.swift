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
    private let questionLabel = QuestionLabel()
    private let questionBrain = QuestionBrain()
    private let gradientView = GradientView()
    private let answerButtons = AnswersCollectionViewCell()
    private let collectionView = AnswerButtonCollectionView(frame: .zero,
                                            collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [questionLabel,collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    private lazy var stackView2 = UIStackView(arrangedSubviews: buttonsArray,
                                             axis: .horizontal,
                                             spacing: 20)
 
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
        view.addSubview(gradientView)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(setTimer)
        stackView2.alignment = .fill
        stackView2.distribution = .fillEqually
        setTimer.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectAnswerDelegate = self
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
            questionLabel.topAnchor.constraint(equalTo: setTimer.bottomAnchor,constant: 50),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            questionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: 20)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor,constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 20)
        ])
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
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

