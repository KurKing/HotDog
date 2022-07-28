//
//  PlaySound.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import AVFoundation

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        }
    }
}
