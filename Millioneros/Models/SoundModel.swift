//
//  SoundModel.swift
//  Millioneros
//
//  Created by VT on 12.11.2022.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!


func playSound(resource: String) {
    let url = Bundle.main.url(forResource: resource, withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player?.play()
}
