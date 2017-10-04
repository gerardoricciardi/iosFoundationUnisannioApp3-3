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
    
    
    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        videoView.backgroundColor = UIColor.blue
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        //        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenSize.width, height: screenSize.height))
        //        self.view.layer.addSublayer(playerLayer)
        videoView.layer.addSublayer(playerLayer)
        playerLayer.frame = videoView.bounds
        
        //        playerLayer.frame = self.view.bounds
        //        subView.layer.addSublayer(playerLayer)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pauseAction(_ sender: UIButton) {
        player.pause()
    }
    @IBAction func playAction(_ sender: UIButton) {
        player.play()
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
