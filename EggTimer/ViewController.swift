//
//  ViewController.swift
//  EggTimer
//
//  Created by Barry on 4/5/20.
//  Copyright © 2020 Barry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let eggTimes = ["Soft":2,"Medium":4,"Hard":6];
    
    var timer:Timer?
    var secondRemaining = 20

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer?.invalidate();
        
        let hardness = sender.currentTitle!;
        
        secondRemaining = eggTimes[hardness]!;
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(updateTimer),userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        if(secondRemaining > 0){
            print("\(secondRemaining) seconds");
            secondRemaining-=1;
        }else{
            titleLabel.text = "Done!";
            timer?.invalidate();
            timer = nil;
        }
    }
}

