import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.alpha = 0.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func addContainerView () {
        contentView.addSubview(containerView)
    }
    
    func addScoreLabel (text: String) {
        scoreLabel.text = text
        contentView.addSubview(scoreLabel)
        
    }
    
    func changeCell(text: String, color: UIColor) {
        scoreLabel.text = text
        containerView.backgroundColor = color
    }
    
    func createConstraint () {
         
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            scoreLabel.widthAnchor.constraint(equalToConstant: 80),
            scoreLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1)
        
        ])
    }
    

}
