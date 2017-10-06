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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        videoView.backgroundColor = UIColor.blue
//        let videoURL = URL(string: url)
        var videoData: Data!
        
        
        videoData = TestSaverRecord.getVideoFromEsercizio(nomeEsercizio: "allungamenti adduttori")
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String
        let destinationPath = documentsPath + String("/video.mp4")
        
        
        FileManager.default.createFile(atPath: destinationPath,contents:videoData, attributes:nil)
        
        let fileURL = URL(fileURLWithPath: destinationPath)
        print(fileURL)
        
        var  asset:AVAsset
        asset = (AVAsset(url: fileURL) as! AVURLAsset)
        let playerItem = AVPlayerItem(asset: asset)
        
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player:player)
        playerLayer.videoGravity=AVLayerVideoGravity.resizeAspectFill
        videoView.layer.addSublayer(playerLayer)
        playerLayer.frame=videoView.bounds

        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        
        
//
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//
//
//        self.present(playerController, animated: true) {
//
//            playerController.player!.play()
//        }
//        present(playerController, animated: true) {
//            self.player.play()
//        }

        
        
        
//
//        videoView.addSubview(playerController.view)
//

        
        //        playerLayer.frame = self.view.bounds
        //        subView.layer.addSublayer(playerLayer)
        timerLabel.textColor = UIColor.white
        timerLabel.text = "00:00,00"
        playButton.setTitleColor(backgroundColor, for: UIControlState.normal)
        pauseButton.setTitleColor(backgroundColor, for: UIControlState.normal)
        pauseButton.isEnabled = false
        pauseButton.isHidden = true
        
        // Do any additional setup after loading the view.
      
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
        timer.invalidate()
        playButton.isHidden = true
        pauseButton.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twop = storyboard.instantiateViewController(withIdentifier: "main") as! MainViewController
        let alertController = UIAlertController(title: "Health Desk", message:
            "Great, workout completed", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action) -> Void in
                self.present(twop, animated: true, completion: nil)
            let defaults = UserDefaults.standard
            let isEndedWorkout = true
            defaults.set(isEndedWorkout, forKey: "isEndedWorkout")
            defaults.synchronize()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        player.pause()
        pauseButton.isSelected = true
        pauseButton.isHidden = true
        pauseButton.isEnabled = false
        
        playButton.isHidden = false
        playButton.isSelected = false
        playButton.isEnabled = true
        timer.invalidate()
    }
    @IBAction func playAction(_ sender: UIButton) {
        player.play()
        playButton.isSelected = true
        playButton.isEnabled = false
        playButton.isHidden = true
        pauseButton.isSelected = false
        pauseButton.isHidden = false
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
