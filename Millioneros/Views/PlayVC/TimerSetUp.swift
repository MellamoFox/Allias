//
//  TimerSetUp.swift
//  Millioneros
//
//  Created by VT on 08.11.2022.
//

import Foundation
import UIKit

let shapeLayer = CAShapeLayer()
var timerLabel = UILabel()
var timer = Timer()
var totalTime = 30
var secondsPassed = 0

class TimerSetUp: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timerTrack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func timerTrack() {
        let center = center
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: 40,
                                        startAngle: 0 / 2,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.yellow.cgColor
        shapeLayer.lineWidth = 10
        DispatchQueue.main.async {
        shapeLayer.strokeEnd = CGFloat(secondsPassed / totalTime)
        }
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(totalTime)
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "UrSoBasic")
        layer.addSublayer(trackLayer)
        layer.addSublayer(shapeLayer)
    }
}
