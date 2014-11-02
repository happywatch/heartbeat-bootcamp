//
//  WatchAppViewController.swift
//  WatchSimulator
//
//  Created by temporary on 10/12/14.
//  Copyright (c) 2014 Ben Morrow. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    @IBOutlet weak var bpmLabel: UILabel!
    
    var currentBeatPattern = BeatPattern()
    
    var lastBeatPattern = 0
    
    let shrinkFactor = CGFloat(2.0 / 3)
    
    var expandFactor: CGFloat {
        get {
            return 1 / shrinkFactor
        }
    }
    
    var beatPatterns: [[AnyObject?]] = [
        ["💛", "Fast", 180],
        ["❤️", "Mid-range", 80],
        ["💜", "Slow", 55],
        ["💙", "Sedated", 30]
        ]
    
    let iconLabel = UILabel()
    
    var totalBeats: Int {
        get {
            var returnValue : Int? = NSUserDefaults.standardUserDefaults().objectForKey("totalBeats") as? Int
            if returnValue == nil { //Check for first run of app
                returnValue = 0; //Default value
            }
            return returnValue!
        }
        set (newValue) {
            //  Each item in newValue is now a NSString
            let val = newValue as Int
            NSUserDefaults.standardUserDefaults().setObject(val, forKey: "totalBeats")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any more setup after this
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.view.insertSubview(iconLabel, atIndex: 1)
        iconLabel.transform = CGAffineTransformMakeScale(shrinkFactor, shrinkFactor)
        iconLabel.frame = self.view.bounds
        iconLabel.textAlignment = .Center
        iconLabel.font = UIFont.boldSystemFontOfSize(132)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "newBeat");
        tapRecognizer.numberOfTapsRequired = 1;
        tapRecognizer.numberOfTouchesRequired = 1;
        self.view.addGestureRecognizer(tapRecognizer);
        
        var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "showTotalBeats")
        longPressRecognizer.minimumPressDuration = 2.0;
        self.view.addGestureRecognizer(longPressRecognizer)
        
        newBeat()
        beat()
    }
    
    func showTotalBeats(){
        
        self.performSegueWithIdentifier("totalBeatsSegue", sender: self)
        
    }
    
    func newBeat() {
        //var randomBeatPatternIndex = Int(arc4random_uniform(UInt32(beatPatterns.count)))
        
        let beatValues = beatPatterns[lastBeatPattern % 4]
        lastBeatPattern++
        currentBeatPattern = BeatPattern(icon: beatValues[0] as String, description: beatValues[1] as String, bpm: beatValues[2] as Int)
        
        bpmLabel.text = "\(currentBeatPattern.bpm)"
        iconLabel.text = currentBeatPattern.icon
    }
    
    func beat() {
        UIView.animateWithDuration(currentBeatPattern.duration / 2, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.iconLabel.transform = CGAffineTransformScale(self.iconLabel.transform, self.expandFactor, self.expandFactor)
            }, completion: { _ in
                UIView.animateWithDuration(self.currentBeatPattern.duration / 2, delay: 0.0, options: .CurveEaseInOut, animations: {
                        self.iconLabel.transform = CGAffineTransformScale(self.iconLabel.transform, self.shrinkFactor, self.shrinkFactor)
                    }, completion: { _ in
                        self.totalBeats++
                        self.beat()
                })
        })
    }


}
