import UIKit

protocol ScoresVCDelegate: AnyObject {
    func vcWasClosed()
}

class ScoresVC: UIViewController {
    
    // MARK: - Constans and Variabels
    
    private var scoreTableView = UITableView()
    private var backButton = UIButton()
    private let gradientView = GradientView()
    
    weak var delegate: ScoresVCDelegate?
    
    var yourWin = 2000
    let scoreStringArray = ["0","100","200","300","500","1000","2000","4000","8000","32 000","64 000","125 000","250 000","500 000","1 000 000"]
    let scoreIntArray = [0, 100, 200, 300, 500, 1000, 2000, 4000, 8000, 32000, 64000, 125000, 250000, 500000, 1000000]
    
    //MARK: - Lifecycle of Controller
    override func viewDidLoad() {
        super.viewDidLoad()

        
        createTureAnswerTable()
        setupViews()
        createButtonBack()
        setConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scoreTableView.reloadData()
    }
    //MARK: - Methods
    
    
    private func createButtonBack () {
        
        backButton = UIButton(type: .system)
        backButton.backgroundColor = .brown
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont(name: "System", size: 20)
        backButton.layer.cornerRadius = 20
        backButton.setTitle("Play again", for: .normal)
        backButton.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: scoreTableView.bottomAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    private func setupViews() {
        
        self.navigationController?.isNavigationBarHidden = true
        
        scoreTableView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gradientView)
        view.addSubview(scoreTableView)
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
            scoreTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.20)
            
            
        ])
        
    }
    
    @objc private func backbuttonTapped() {
        print("sad")
        _ = navigationController?.popViewController(animated: true)
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