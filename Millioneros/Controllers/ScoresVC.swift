import UIKit

protocol ScoresVCDelegate: AnyObject {
    func vcWasClosed()
}

class ScoresVC: UIViewController {
    
    // MARK: - Constans and Variabels
    
    var userResults = Bool()
    var yourWin = 0
    private var scoreTableView = UITableView()
    private var continueButton = ContinueButton()
    private var backWelcomVCButton = BackWelcomVCButton()
    private let gradientView = GradientView()
    
    weak var delegate: ScoresVCDelegate?
    
    let scoreStringArray = ["0","100","200","300","500","1000","2000","4000","8000","32 000","64 000","125 000","250 000","500 000","1 000 000"]
    let scoreIntArray = [0, 100, 200, 300, 500, 1000, 2000, 4000, 8000, 32000, 64000, 125000, 250000, 500000, 1000000]
    
    var emptyArray = [2]
    
    //MARK: - Lifecycle of Controller
    override func viewDidLoad() {
        super.viewDidLoad()

        createTureAnswerTable()
        setupViews()
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkUserResults()
        continueButton.addTarget(self, action: #selector(userDecide), for: .touchUpInside)
        backWelcomVCButton.addTarget(self, action: #selector(backWelcomeVC), for: .touchUpInside)
        scoreTableView.reloadData()
        
        
        let settings = Settings(name: "fdsfsfs", recordsArray: emptyArray)
        UserDefaults.standard.set(encodable: settings, forKey: "settings")
        
        let setting = UserDefaults.standard.value(Settings.self, forKey: "settings")
        print(setting?.recordsArray)
    }
    //MARK: - Methods
    
    func checkUserResults() {
        switch userResults {
        case false : continueButton.setTitle("Попробовать еще", for: .normal)
            print(userResults)
            print(yourWin)
        case true : continueButton.setTitle("Продолжить", for: .normal)
            print(userResults)
            print(yourWin)
        }
    }
    
    @objc private func userDecide(_ sender: UIButton) {
        switch userResults {
        case true:
             navigationController?.popViewController(animated: true)
        default :
            print("GameOver")

        }
    }
    
    @IBAction func backWelcomeVC () {
        
        let settings = Settings(name: "fdsfsfs", recordsArray: emptyArray)
        UserDefaults.standard.set(encodable: settings, forKey: "settings")
        navigationController?.popToRootViewController(animated: false)
    }
    
    private func setupViews() {
        
        self.navigationController?.isNavigationBarHidden = true
        
        view.addSubview(gradientView)
        view.addSubview(scoreTableView)
        view.addSubview(continueButton)
        view.addSubview(backWelcomVCButton)
        
        scoreTableView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        backWelcomVCButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            gradientView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            scoreTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scoreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scoreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scoreTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.20),
            
            continueButton.topAnchor.constraint(equalTo: scoreTableView.bottomAnchor, constant: 20),
            continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            backWelcomVCButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 5),
            backWelcomVCButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            backWelcomVCButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            backWelcomVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
        ])
        
    }
    
    private func createTureAnswerTable() {
        
        self.scoreTableView = UITableView(frame: view.bounds, style: .plain)
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        scoreTableView.backgroundColor = .clear
        scoreTableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: "ScoreTableViewCell")
        
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
    
        return cell
    }
}
