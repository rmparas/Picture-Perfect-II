//
//  ViewController.swift
//  Picture Perfect II
//
//  Created by Rod Paras on 3/15/15.
//  Copyright (c) 2015 Rodacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true;
    }

    @IBAction func stopAudionButton(sender: AnyObject) {
        println("made it here 2");
        recordingLabel.hidden = true;
    }
    @IBAction func recordAudio(sender: UIButton) {
        
        stopButton.hidden = false;
        recordingLabel.hidden = false;
        println("made it here");        0
    }
}

