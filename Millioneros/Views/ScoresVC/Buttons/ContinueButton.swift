import UIKit
import Foundation

class ContinueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .brown
        layer.cornerRadius = 10
        setTitle("Продолжить", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "System", size: 20)
        
    }
}
