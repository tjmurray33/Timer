//
//  countDownViewController.swift
//  Final
//
//  Created by tmurray on 12/8/15.
//  Copyright © 2015 tmurray. All rights reserved.
//

import UIKit

class countDownViewController: UIViewController {
    var timerCount = 20
    var timerRunning = false
    var timer = NSTimer()
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
 //   @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var changeLabel: UITextField!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // backgroundImage.contentMode = UIViewContentMode.ScaleToFill
       // backgroundImage.image = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }
    
    func Counting() {
        timerCount -= 1
        timerLabel.text = "\(timerCount)"
    }
    
    @IBAction func startButton(sender: UIButton) {
            timerCount = Int(changeLabel.text!)!
            timerLabel.text = changeLabel.text;
            if timerRunning == false {
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
                timerRunning = true
                changeLabel.resignFirstResponder()

            }
    }
    
    @IBAction func stopButton(sender: UIButton) {
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
            changeLabel.resignFirstResponder()

        }
        
    }
    
    @IBAction func restartButton(sender: UIButton) {
        
        timerCount = Int(changeLabel.text!)!
        timerLabel.text = changeLabel.text;
        changeLabel.resignFirstResponder()
    }
}
