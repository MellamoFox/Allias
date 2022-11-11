import UIKit

extension PlayVC {
    
    func showHappyAlert(score: Int)  {
        
        if score == 1000000 {
            //            // create the alert
            let alert = UIAlertController(title: "Поздравляю, ты выйграл \(score)", message: "Теперь ты Миллионер ", preferredStyle: UIAlertController.Style.alert)
            //
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ура!!!", style: UIAlertAction.Style.default))
            //            // show the alert
            self.present(alert, animated: true)
        } else {
            return
        }
        
    }
}
