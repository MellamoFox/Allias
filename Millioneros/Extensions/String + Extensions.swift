//
//  String + Extensions.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation

extension String {
    
    enum ValidityType {
        case name
        case email
        case password
        case number
    }
    
    enum Regex: String {
        case name = "[a-z A-Z 0-9 -]{1,20}"
        case email = "[a-z A-Z 0-9 -]"
        case password = "[a-z A-Z 0-9]{1,20}"
        case number = "[0-9]"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .name:
            regex = Regex.name.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .number:
            regex = Regex.name.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)

    }
}
