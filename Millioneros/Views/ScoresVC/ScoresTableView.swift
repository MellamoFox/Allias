

import UIKit

class ScoresTableView: UITableView {
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    private func configureTableView() {
        
        register(ScoreTableViewCell.self, forCellReuseIdentifier: "ScoreTableViewCell")
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        
    }
}
