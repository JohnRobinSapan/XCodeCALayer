//
//  SongViewController.swift
//  CALayer
//
//  Created by John on 2020-02-11.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit
import AVFoundation
class SongViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet var volSlider : UISlider!
    @IBOutlet var sgSong : UISegmentedControl!
    var soundPlayer : AVAudioPlayer?
    
    // step 10, get sound going in viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        playSong(song: "song1")
        
    }
    
    // step 10b, implement viewDidDisappear to
    // turn off music when leaving the view
    override func viewDidDisappear(_ animated: Bool) {
        soundPlayer?.stop()
    }
    
    
    // step 9, add the following event handler for volume control
    @IBAction func volumeDidChange(sender : UISlider)
    {
        soundPlayer?.volume = volSlider.value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func playSong(song : String) {
        // sound file exists in the bundle, retrieve it
        let soundURL = Bundle.main.path(forResource: song, ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        
        // soundPlayer connects to url of file
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = self.volSlider.value
        // repeat forever
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
    }
    
    func updateSong() {
        let song = sgSong.selectedSegmentIndex;
        soundPlayer?.stop()
        switch song {
        case 0:
            playSong(song: "song1")
        case 1:
            playSong(song: "song2")
        default:
            playSong(song: "song3")
        }
    }
    
    @IBAction func segmentDidChange(sender : UISegmentedControl) {
        updateSong()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
