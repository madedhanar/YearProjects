//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hardnessLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    let eggTime = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    var timeRemaining = 1
    var timer = Timer()
    var totalTime = 0
    var timePassed = 0
    
    @IBAction func eggTimer(_ sender: UIButton) {
        timerProgress.progress = 0
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        timeRemaining = eggTime[hardness]! + 1
        hardnessLabel.text = sender.currentTitle!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @objc func countdown(){
        if timePassed < totalTime {
            print("\(timeRemaining) seconds.")
            timePassed += 1
            timeRemaining -= 1
            timerLabel.text = String("\(timeRemaining)")
            timerProgress.progress = Float(timePassed) / Float(totalTime)

        } else {
            timer.invalidate()
            timePassed = 0
            totalTime = 0
            timerLabel.text = "Done!"
        }
        
        
    }

}
