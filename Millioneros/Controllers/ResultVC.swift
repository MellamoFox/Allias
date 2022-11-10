//
//  ResultVC.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation
import UIKit

class ResultVC: UIViewController {
    
    let resultsArray = ["0","100","200","300","500","1000","2000","4000","8000","32 000","64 000","125 000","250 000","500 000","1 000 000"]
    

    private let goOneButton = GoOneButton()
    private let gradientView = GradientView()
    private let collectionView = ResultsCollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var stackView = UIStackView(arrangedSubviews: [collectionView,goOneButton],
                                             axis: .vertical,
                                             spacing: 10)
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkUserResults()
        setupViews()
        setConstraints()
        setDelegates()
        
    }
    private func setupViews() {
        
        self.navigationController?.isNavigationBarHidden = true
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        view.addSubview(stackView)
        goOneButton.addTarget(self, action: #selector(userDecide), for: .touchUpInside)
      
    }
    func checkUserResults() {
        switch userResults {
        case false : goOneButton.setTitle("Попробовать еще", for: .normal)
        case true : goOneButton.setTitle("Продолжить", for: .normal)
        }
    }
    @objc private func userDecide(_ sender: UIButton) {
        switch userResults {
        case true:
            _ = navigationController?.popViewController(animated: true)
        default :
            print("GameOver")

        }
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectPrizeDelegate = self
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
    }
}

extension ResultVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resultsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdPrize.idPrizeCell.rawValue, for: indexPath) as? PrizeCollectionViewCell
        else { return UICollectionViewCell() }
        

        guard let settin = UserDefaults.standard.value(Settings.self, forKey: "settings") else { return UICollectionViewCell() }
        let sortArray = (settin.recordsArray.sorted())
        
        cell.configureContentView()
        cell.setupPrizeLabel(text: "\(sortArray[indexPath.row])")
        
        cell.setupNameLabel(text: "Name")
        cell.setConstraint()
        cell.setupLabel(text: resultsArray.reversed()[indexPath.row])
        cell.setConstraints()
        
        return cell
    }
    
}

extension ResultVC: SelectPrizeProtocol {
    func selectPrize(indexPath: IndexPath) {
        print(indexPath)
    }
}
