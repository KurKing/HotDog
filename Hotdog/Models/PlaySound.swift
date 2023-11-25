//
//  PlaySound.swift
//  Hotdog
//
//  Created by Oleksiy on 10.09.2020.
//  Copyright © 2020 Oleksiy. All rights reserved.
//

import AVFoundation

class SoundPlayer {
    
    private var audioPlayer: AVAudioPlayer?
    
    private func playSound(sound: String, type: String = "mp3") {
        
        guard let path = Bundle.main.path(forResource: sound, ofType: type),
              let audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path)) else {
            
            print("ERROR: Could not find and play the sound file!")
            return
        }
        
        self.audioPlayer = audioPlayer
        audioPlayer.play()
    }
}

// MARK: - Public methods
extension SoundPlayer {
    
    func playRiseSound() {
        
        playSound(sound: "sound-rise")
    }
}
