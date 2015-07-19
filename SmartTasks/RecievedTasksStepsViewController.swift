//
//  RecievedTasksStepsViewController.swift
//  SmartTasks
//
//  Created by Shubham Kothari on 16/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class RecievedTasksStepsViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "task1bgimage.png")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

        
    var time: String = "600"
        @IBOutlet var displayTimeLabel: UILabel!
        
        var startTime = NSTimeInterval()
        
        var timer:NSTimer = NSTimer()

        
        @IBAction func start(sender: AnyObject) {
            if (!timer.valid) {
                let aSelector : Selector = "updateTime"
                timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
                startTime = NSDate.timeIntervalSinceReferenceDate()
            }
        }
        
        @IBAction func stop(sender: AnyObject) {
            timer.invalidate()
        }
        
        func updateTime() {
            var currentTime = NSDate.timeIntervalSinceReferenceDate()
            
            //Find the difference between current time and start time.
            
            let timeInDecimal = NSNumberFormatter().numberFromString(time)!.doubleValue
            var elapsedTime: NSTimeInterval =  timeInDecimal - (currentTime - startTime)
            
            
            //calculate the minutes in elapsed time.
            let minutes = UInt8(elapsedTime / 60.0)
            
            elapsedTime -= (NSTimeInterval(minutes) * 60)
            
            //calculate the seconds in elapsed time.
            let seconds = UInt8(elapsedTime)
            elapsedTime -= NSTimeInterval(seconds)
            
            //find out the fraction of milliseconds to be displayed.
            let fraction = UInt8(elapsedTime * 100)
            
            if ( fraction == 0 && seconds == 0 && minutes == 0) {
                
                timer.invalidate()
            }
            
            //add the leading zero for minutes, seconds and millseconds and store them as string constants
            
            var strMinutes = String(format: "%02d", minutes)
            var strSeconds = String(format: "%02d", seconds)
            var strFraction = String(format: "%02d", fraction)
            
            //concatenate minuets, seconds and milliseconds as assign it to the UILabel
            displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
        }

        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    


