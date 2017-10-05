//
//  VideoWorkoutViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 04/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class VideoWorkoutViewController: UIViewController {
    var player = AVPlayer()
    let screenSize : CGRect = UIScreen.main.bounds
//    var url = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var secondi :Int = 0
    var centesimiDisecondo :Int = 0
    @IBOutlet weak var videoView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoView.backgroundColor = UIColor.blue
//        let videoURL = URL(string: url)
        var videoURL: URL!
       
      
             videoURL = TestSaverRecord.getVideoFromEsercizio(nomeEsercizio: "allungamenti adduttori")
        
        
            
//        qui bisogna passare un path locale e non un url forse
            self.player = AVPlayer(url: videoURL)
        
        
            let playerLayer = AVPlayerLayer(player: self.player)
        //        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenSize.width, height: screenSize.height))
        //        self.view.layer.addSublayer(playerLayer)
            self.videoView.layer.addSublayer(playerLayer)
            playerLayer.frame = self.videoView.bounds
        
        //        playerLayer.frame = self.view.bounds
        //        subView.layer.addSublayer(playerLayer)
        
        
        // Do any additional setup after loading the view.
      
    }
    @IBAction func pauseAction(_ sender: UIButton) {
        player.pause()
    }
    @IBAction func playAction(_ sender: UIButton) {
        player.play()
        let intervallo :Double = 1
        timer = Timer.scheduledTimer(timeInterval: intervallo, target:self, selector: Selector("funzioneTimer"), userInfo: nil, repeats: true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
