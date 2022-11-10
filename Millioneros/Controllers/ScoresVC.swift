
import UIKit

protocol ScoresVCDelegate: AnyObject {
    func vcWasClosed()
}

class ScoresVC: UIViewController {
    
    // MARK: - Constans and Variabels
    
    private var scoreTableView = UITableView()
    private var backButton = UIButton()
    private let gradientView = GradientView()
    private let continueButton = ContinueButton()
    
    
    weak var delegate: ScoresVCDelegate?
    
    let yourWin = 2000
    let scoreStringArray = ["0","100","200","300","500","1000","2000","4000","8000","32 000","64 000","125 000","250 000","500 000","1 000 000"]
    let scoreIntArray = [0, 100, 200, 300, 500, 1000, 2000, 4000, 8000, 32000, 64000, 125000, 250000, 500000, 1000000]
    
    //MARK: - Lifecycle of Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        createTureAnswerTable()
        setConstraints()
        
    }
    
    
    //MARK: - Methods
    
    //   private func createButtonBack () {
    //
    //        backButton = UIButton(type: .system)
    //        backButton = UIButton(type: .system)
    //        backButton.backgroundColor = .brown
    //        backButton.setTitleColor(.white, for: .normal)
    //        backButton.titleLabel?.font = UIFont(name: "System", size: 20)
    //        backButton.layer.cornerRadius = 20
    //        backButton.setTitle("Play again", for: .normal)
    //        bottomContainerView.addSubview(backButton)
    //
    //        backButton.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([
    //
    //            backButton.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 10),
    //            backButton.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -10),
    //            backButton.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 50),
    //            backButton.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -50)
    //        ])
    //
    //        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    //    }
    
    
    private func setupViews() {
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gradientView)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            gradientView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
        ])
        
    }
    
    
    private func createTureAnswerTable() {
        
        self.scoreTableView = UITableView(frame: view.bounds, style: .plain)
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        scoreTableView.backgroundColor = .clear
        view.addSubview(scoreTableView)
        
        scoreTableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: "ScoreTableViewCell")
        scoreTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
}

// MARK: - UITableViewDelegate extension
extension ScoresVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

// MARK: - UITableViewDataSource extension
extension ScoresVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scoreStringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath) as? ScoreTableViewCell else { return  UITableViewCell () }
        
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        
        cell.addContainerView()
        
        for (index, value) in scoreIntArray.enumerated() {
            
            if value == yourWin {
                switch indexPath.row {
                    
                case index :
                    cell.changeCell(text: scoreStringArray[indexPath.row], color: .green)
                case 14:
                    cell.changeCell(text: scoreStringArray[indexPath.row], color: .red)
                case 5:
                    cell.changeCell(text: scoreStringArray[indexPath.row], color: .red)
                case 9:
                    cell.changeCell(text: scoreStringArray[indexPath.row], color: .red)
                default:
                    cell.changeCell(text: scoreStringArray[index], color: .blue)
                }
            }
        }
        
        cell.addScoreLabel(text: scoreStringArray[indexPath.row])
        cell.createConstraint()
        
//        if indexPath.row == scoreArray.firstIndex( where: { $0 == yourWin} ){
//            cell.configureCell(moneyTextArray[indexPath.row], .green)
//        }
        
        return cell
    }
}
