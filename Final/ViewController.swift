//
//  ViewController.swift
//  Final
//
//  Created by tmurray on 12/3/15.
//  Copyright © 2015 tmurray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }
    
    func Counting() {
        timerCount += 1
        timerLabel.text = "\(timerCount)"
    }
    
    @IBAction func startButton(sender: UIButton){
        
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
            timerRunning = true
        }
        
    }
    
    @IBAction func stopButton(sender: UIButton) {
        
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
        }
    }
    
    @IBAction func restartButton(sender: UIButton) {
        timerCount = 0
        timerLabel.text = "0"
    }
}
