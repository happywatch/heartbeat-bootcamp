//
//  DetailViewController.swift
//  WatchSimulator
//
//  Created by temporary on 11/1/14.
//  Copyright (c) 2014 Ben Morrow. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var totalBeatsLabel: UILabel!
    
    var totalBeats: Int {
        get {
            var returnValue : Int? = NSUserDefaults.standardUserDefaults().objectForKey("totalBeats") as? Int
            if returnValue == nil { //Check for first run of app
                returnValue = 0; //Default value
            }
            return returnValue!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalBeatsLabel.text = "\(totalBeats)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
