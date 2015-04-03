//
//  PlaySoundViewController.swift
//  Picture Perfect II
//
//  Created by Rod Paras on 3/17/15.
//  Copyright (c) 2015 Rodacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        stopButton.hidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopPlayback(sender: UIButton) {
        
        audioPlayer.stop()
        audioEngine.stop()
    }
    
    @IBAction func replayFastSound(sender: UIButton) {
        
        resetAudioEngine()
        setStdAudioParam()
        stopButton.hidden = false
        audioPlayer.rate = 2.0
        audioPlayer.play()
    }

    @IBAction func replaySlowSound(sender: UIButton) {
        
        resetAudioEngine()
        setStdAudioParam()
        stopButton.hidden = false
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
    
        playAudioWithVariablePitch(1000)
    }
    
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
    
        playAudioWithVariablePitch(-800)
    }
 
    
    //Utility Functions
    
    func playAudioWithVariablePitch(pitch: Float){
        
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        stopButton.hidden = false
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    

    func setStdAudioParam() {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    func resetAudioEngine() {
        
        audioEngine.stop()
        audioEngine.reset()
    }
    
}
