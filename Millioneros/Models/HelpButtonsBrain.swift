



import UIKit

struct HelpButtonsBrain {
    
    
    
    func fiftyButtonPressed(answersButtonTitle: [String], correctAnswer: String,arrayAnswer: [UIButton]) {
        var allAnsw = answersButtonTitle
        let indexOfCorrectAnswer = allAnsw.firstIndex(of: correctAnswer) ?? 0
        allAnsw.remove(at: indexOfCorrectAnswer)
        allAnsw.remove(at: Int.random(in: 0...allAnsw.count-1))
        
        for buttonText in arrayAnswer {
            if allAnsw.contains(buttonText.currentTitle!) {
                buttonText.isHidden = true
            }
        }
    }
    
    func callFriendButtonPressed(answersButtonTitle: [String], correctAnswer: String,arrayAnswer: [UIButton], levelAnswer: Int) -> String {
        var allAnsw = answersButtonTitle
        let indexOfCorrectAnswer = allAnsw.firstIndex(of: correctAnswer) ?? 0
        
    switch levelAnswer {
    case 0...9:
        return correctAnswer
    case 10...19:
        allAnsw.remove(at: indexOfCorrectAnswer)
        allAnsw.remove(at: Int.random(in: 0...allAnsw.count-1))
        allAnsw.remove(at: Int.random(in: 0...allAnsw.count-1))
        allAnsw.append(correctAnswer)
        let randEl = allAnsw.randomElement() ?? "Erorr"
        return randEl
    case 20...29:
        allAnsw.remove(at: indexOfCorrectAnswer)
        allAnsw.remove(at: Int.random(in: 0...allAnsw.count-1))
        allAnsw.append(correctAnswer)
        let randEl = allAnsw.randomElement() ?? "Erorr"
        return randEl
    default:
        return correctAnswer
        
    }
    
        
    }
    
    func indexFriendAnswer(answersButtonTitle: [String], answer: String) -> Int {
        
        let index = answersButtonTitle.firstIndex(of: answer) ?? 0
        return index
}
    
}


// for 50 buttons
extension PlayVC {
    
    func updateUI(buttonAnswer: [UIButton]) {
        for answer in buttonAnswer {
            answer.isHidden = false
        }
    }
    
}

// for call
extension PlayVC {
    
    func showAlertButtonTapped(answer: String, index: Int)  {

        
            // create the alert
        let alert = UIAlertController(title: "Привет! Я бы выбрал \(answer)", message: "Если согласен со мной, то нажимай на \(answer)", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Подумаю", style: UIAlertAction.Style.default))
        alert.addAction(UIAlertAction(title: "\(answer)", style: UIAlertAction.Style.cancel){_ in
            self.answerButtonTapped(answerButtonsArray[index])
        })

            // show the alert
        self.present(alert, animated: true)

        }
    
}

// for badAnswer
extension PlayVC {
    
    func mistakeButtonPressed()  {
        

        
    }
}
