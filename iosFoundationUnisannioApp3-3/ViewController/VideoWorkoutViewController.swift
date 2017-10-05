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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    let backgroundColor = UIColor(red: 54.0/255.0, green: 155.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    var player = AVPlayer()
    let screenSize : CGRect = UIScreen.main.bounds
//    var url = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    
    
    
    var time = 0
    var timer = Timer()
    var minutiD :Int = 0
    var minuti :Int = 0
    var secondiD :Int = 0
    var secondi :Int = 0
    var centesimiDiSecondo :Int = 0
    var millesimiDiSecondo :Int = 0
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
        timerLabel.textColor = backgroundColor
        timerLabel.text = "00:00,00"
        playButton.setTitleColor(backgroundColor, for: UIControlState.normal)
        pauseButton.setTitleColor(backgroundColor, for: UIControlState.normal)
        pauseButton.isEnabled = false
        
        // Do any additional setup after loading the view.
      
    }
    @IBAction func pauseAction(_ sender: UIButton) {
        player.pause()
        pauseButton.isSelected = true
        pauseButton.isEnabled = false
        playButton.isSelected = false
        playButton.isEnabled = true
        timer.invalidate()
    }
    @IBAction func playAction(_ sender: UIButton) {
        player.play()
        playButton.isSelected = true
        playButton.isEnabled = false
        pauseButton.isSelected = false
        pauseButton.isEnabled = true
        let intervallo :Double = 0.01
        timer = Timer.scheduledTimer(timeInterval: intervallo, target:self, selector: #selector(VideoWorkoutViewController.timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        millesimiDiSecondo += Int(timer.timeInterval * 100)
        if millesimiDiSecondo >= 10{
            centesimiDiSecondo += 1
            millesimiDiSecondo = 0
            if centesimiDiSecondo >= 10{
                secondi += 1
                centesimiDiSecondo = 0
                if secondi >= 10{
                    secondiD += 1
                    secondi = 0
                    if secondiD >= 6{
                        minuti += 1
                        secondiD = 0
                        if minuti >= 10{
                            minutiD += 1
                            minuti = 0
                        }
                    }
                }
            }
        }
        
        timerLabel.text = "\(minutiD)\(minuti):\(secondiD)\(secondi),\(centesimiDiSecondo)\(millesimiDiSecondo)"
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
