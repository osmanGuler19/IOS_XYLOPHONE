//
//  ViewController.swift
//  Xylophone
//
//  Created by Osman Güler on 24.10.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate {
    
    var player : AVAudioPlayer!
    var soundArray = ["C", "D", "E", "F", "G", "A", "B"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func playNote(_ sender: UIButton) {
        var selectedSound = soundArray[sender.tag-1]
        playingSound(chooseSound: selectedSound)
    }
    
    func playingSound(chooseSound: String){
        let soundUrl = Bundle.main.url(forResource: chooseSound, withExtension: ".wav", subdirectory: "Sounds")
        do{
            try player = AVAudioPlayer(contentsOf: soundUrl!)
            player.prepareToPlay()
            player.play()
        }catch{
            print(error)
        }
    }
}

