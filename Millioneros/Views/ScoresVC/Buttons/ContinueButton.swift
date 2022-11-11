

import UIKit
import Foundation

class ContinueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        alpha = 0.8
        backgroundColor = .green
        layer.cornerRadius = 20
        setTitle("Продолжить", for: .normal)
        setTitleColor(.green, for: .normal)
        titleLabel?.font = UIFont(name: "Avenir Bool", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
