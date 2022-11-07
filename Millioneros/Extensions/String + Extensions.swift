//
//  String + Extensions.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation

//MARK: - Checking for the correct player name
extension String {
    
    func isValid() -> Bool {
        let regEx = "[a-zA-Z0-9._]"
        return NSPredicate(format: regEx).evaluate(with: self)
    }
}
