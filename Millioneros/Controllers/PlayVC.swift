//
//  PlayVC.swift
//  Millioneros
//
//  Created by VT on 06.11.2022.
//

import UIKit


class PlayVC: UIViewController {
    
    var userResults = true
    var yourWin = 0
    private let timerLabel = TimerLabel()
    private let helpButtons = HelpButtons()
    private let answerButtons = AnswerButtons()
    private let questionLabel = QuestionLabel()
    private var questionBrain = QuestionBrain()
    private let gradientView = GradientView()
    private let resultVC = ScoresVC()
    private let helpButtonsBrain = HelpButtonsBrain()
    private var sound = "startSound"
    var mistakeBool = false
    var takeMoney = true
    var timer = Timer()
    var totalTime = 30
    
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

        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupViews()
        setupButtonsAction()
        setupHelpButtonsAction()
        setStackViews()
        setConstraints()
        setTimerConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTimer()
        chooseMusic()
        activateButtons()
        setupViews()
        setAnswerTitles()
        questionLabel.text = ""
        questionLabel.animation(typing: questionBrain.getQuestion().text, duration: 0.05)
        
    }
    
    private func setupViews() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        view.addSubview(stackView)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        view.addSubview(questionLabel)
        view.addSubview(timerLabel)
    }
    
    private func setTimer() {
        timerLabel.alpha = 1
        var secondsPassed = 0
        timerLabel.text = "30"
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        timer.invalidate()
        timerLabel.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        timerLabel.layer.cornerRadius = 40
        timerLabel.center = view.center
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            switch secondsPassed {
            case 0..<10 : timerLabel.layer.borderColor = UIColor.green.cgColor
                secondsPassed += 1
                self.timerLabel.text = "\(self.totalTime - secondsPassed)"
            case 10..<20 : timerLabel.layer.borderColor = UIColor.yellow.cgColor
                secondsPassed += 1
                self.timerLabel.text = "\(self.totalTime - secondsPassed)"
            case 20..<30 : timerLabel.layer.borderColor = UIColor.red.cgColor
                secondsPassed += 1
                timerLabel.blink()
                self.timerLabel.text = "\(self.totalTime - secondsPassed)"
            case 30 : timerLabel.layer.borderColor = UIColor.black.cgColor
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: { [] in
                    print("Should be faster")
                })
            default : timer.invalidate()
            }
        }
    }
    
    private func setupButtonsAction() {
        for i in answerButtonsArray {
            i.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setupHelpButtonsAction() {
        for i in helpButtonsArray {
            i.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        }
    }
    
    private func chooseMusic() {
        switch questionBrain.questionNumber {
        case 1..<5:
            sound = "startSound"
            playSound(resource: sound)
        default:
            sound = "hardQuestionSound"
            playSound(resource: sound)
            
        }
    }
    
    private func setAnswerTitles() {
        for i in 0..<4 {
            let answer = questionBrain.getQuestion().answers
            answerButtonsArray[i].setTitle("\(answer[i])", for: .normal)
            answerButtonsArray[i].backgroundColor = .none
            answerButtonsArray[i].setTitleColor(.white, for: .normal)
        }
    }
    
    private func activateButtons() {
        for i in 0..<4 {
            answerButtonsArray[i].isEnabled = true
            answerButtonsArray[i].alpha = 1

        }
    }
    
    
    private func setStackViews() {
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView2.alignment = .fill
        stackView2.distribution = .fillEqually
        stackView3.alignment = .fill
        stackView3.distribution = .fillEqually
        
    }
    
    @objc private func helpButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        sender.alpha = 0.5
        let currentTitle = sender.currentTitle!
        let allAnswers = questionBrain.getQuestion().answers
        let correntAnswer = questionBrain.getQuestion().rightAnswer
        
        
        if currentTitle == "50/50" {
            helpButtonsBrain.fiftyButtonPressed(answersButtonTitle: allAnswers, correctAnswer: correntAnswer, arrayAnswer: answerButtonsArray)
        } else if currentTitle == "Call" {
            player.stop()
            sound = "hallHelp"
            playSound(resource: sound)
            let friendAnswer =  helpButtonsBrain.callFriendButtonPressed(answersButtonTitle: allAnswers, correctAnswer: correntAnswer, arrayAnswer: answerButtonsArray, levelAnswer: questionBrain.questionIndex)
            let indexFriend = helpButtonsBrain.indexFriendAnswer(answersButtonTitle: allAnswers, answer: friendAnswer)
            showAlertButtonTapped(answer: friendAnswer, index: indexFriend)
        } else if currentTitle == "Mistake" {
            mistakeBool = true
            
        } else if currentTitle == "Money" {
            takeMoney = false
        }
    }
    
    @objc func answerButtonTapped(_ sender: UIButton) {
        for i in 0..<4 {
            answerButtonsArray[i].isEnabled = false
        }
        timer.invalidate()
        sender.isEnabled = true
        sender.isEnabled = false
        sender.backgroundColor = .yellow
        player.stop()
        sound = "answerAccepted"
        playSound(resource: sound)
        sender.setTitleColor(.black, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: { [self] in
            let userAnswer = sender.currentTitle
            let userGotItRight = self.questionBrain.checkAnswer(userAnswer: userAnswer!)
            if userGotItRight {
                sender.blink()
                player.stop()
                sound = "rightAnswer"
                playSound(resource: sound)
                userResults = moneyButtonPressed(change: takeMoney)
//                userResults = true
                yourWin = questionBrain.winArray[questionBrain.questionNumber]
                sender.backgroundColor = .green
                mistakeBool = false
                showHappyAlert(score: self.yourWin)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [self] in
                    resultVC.userResults = self.userResults
                    resultVC.yourWin = self.yourWin
                    self.navigationController?.pushViewController(self.resultVC, animated: true)
                    self.questionBrain.nextQuestion()
                    self.updateUI(buttonAnswer: answerButtonsArray)
                })
            } else {
                sender.blink()
                player.stop()
                sound = "wrongAnswer"
                playSound(resource: sound)
                userResults = mistakeButtonPressed(change: mistakeBool)
                sender.backgroundColor = .red
                switch yourWin {
                case 32000..<1000000 : yourWin = questionBrain.winArray[9]
                case 1000..<32000 : yourWin = questionBrain.winArray[5]
                default : yourWin = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [self] in
                    resultVC.userResults = self.userResults
                    resultVC.yourWin = self.yourWin
                    self.navigationController?.pushViewController(self.resultVC, animated: true)
                })
                mistakeBool = false
            }
        })
    }
    
    private func setTimerConstraints(){
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: stackView3.topAnchor,constant: -20),
            timerLabel.heightAnchor.constraint(equalToConstant: 75),
            timerLabel.widthAnchor.constraint(equalToConstant: 75)
            
        ])
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: -10)
        ])
        NSLayoutConstraint.activate([
            stackView2.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            stackView2.heightAnchor.constraint(equalToConstant: 100),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            stackView2.leadingAnchor.constraint(equalTo: stackView.trailingAnchor,constant: 10)
        ])
        NSLayoutConstraint.activate([
            questionLabel.bottomAnchor.constraint(equalTo: stackView2.topAnchor,constant: -20),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            questionLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            stackView3.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -20),
            stackView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            stackView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            stackView3.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}

extension UIView {
    func blink(duration: TimeInterval = 0.1, delay: TimeInterval = 0.1, alpha: CGFloat = 0.5) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.alpha = alpha
        })
    }
}
