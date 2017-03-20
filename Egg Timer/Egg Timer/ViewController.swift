//
//  ViewController.swift
//  Egg Timer
//
//  Created by Tony Nikolov on 3/19/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTimerLabel: UILabel!
    var seconds:Int = 240
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTimer(){
        mTimerLabel.text? = String(seconds)
    }
    
    func processTimePassed(){
        if seconds > 0 {
            mTimerLabel.text?=String(seconds-1)
            seconds = seconds-1
        } else{
            timer.invalidate()
        }
        
    }

    @IBAction func onPauseTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func onPlayTapped(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimePassed), userInfo: nil, repeats: true)
    }

    @IBAction func onResetTapped(_ sender: Any) {
        seconds=240
        timer.invalidate()
        initTimer()
        
    }
    
    @IBAction func onMinusTapped(_ sender: Any) {
        if seconds > 10{
        seconds = seconds - 10
        initTimer()
        }
    }
    
    @IBAction func onPlusTapped(_ sender: Any) {
        seconds = seconds + 10
        initTimer()
    }
}

