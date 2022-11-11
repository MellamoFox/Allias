//
//  FadeInAdnimation.swift
//  Millioneros
//
//  Created by VT on 09.11.2022.
//

import Foundation
import UIKit

class FadeInAdnimation: CABasicAnimation {
    override init() {
        super.init()
        keyPath = "opacity"
        duration = 2.0
        fromValue = 0
        toValue = 1
        fillMode = CAMediaTimingFillMode.forwards
        isRemovedOnCompletion = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


