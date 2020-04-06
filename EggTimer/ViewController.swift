//
//  ViewController.swift
//  EggTimer
//
//  Created by Barry on 4/5/20.
//  Copyright © 2020 Barry. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTimes = ["Soft":2,"Medium":4,"Hard":6];
    
    var timer:Timer?
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer?.invalidate();
        
        let hardness = sender.currentTitle!;
        
        totalTime = eggTimes[hardness]!;
        secondPassed = 0;
        progressBar.progress = 0;
        titleLabel.text = hardness;
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(updateTimer),userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        if(secondPassed < totalTime){
            secondPassed+=1;
            progressBar.progress = Float(secondPassed) / Float(totalTime);
            
            if(secondPassed == totalTime){
                titleLabel.text = "Done!";
                playSound();
            }
            
        }else{
            timer?.invalidate();
            timer = nil;
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "Sound/alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

