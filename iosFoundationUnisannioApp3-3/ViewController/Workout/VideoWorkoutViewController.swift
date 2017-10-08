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
import HealthKit


class VideoWorkoutViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    @IBOutlet weak var backgroundButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var timePopUpLabel: UILabel!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBOutlet weak var centerYpopUpview: NSLayoutConstraint!
    @IBOutlet weak var centerxPopUpView: NSLayoutConstraint!
    
    
    let backgroundColor = UIColor(red: 54.0/255.0, green: 155.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    var player = AVPlayer()
    let screenSize : CGRect = UIScreen.main.bounds
//    var url = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    
    var videoData: Data!

    
    var time = 0
    var timer = Timer()
    var minutiD :Int = 0
    var minuti :Int = 0
    var secondiD :Int = 0
    var secondi :Int = 0
    var centesimiDiSecondo :Int = 0
    var millesimiDiSecondo :Int = 0
    var dateStart = Date()
    

    @IBOutlet weak var videoView: UIView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let videoURL = URL(string: url)
        
        
//        videoData = TestSaverRecord.getVideoFromEsercizio(nomeEsercizio: "allungamenti adduttori")
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
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
        
        
        
        centerYpopUpview.constant = 0
        centerxPopUpView.constant = -400
        continueButton.isHidden = true
        popUpView.layer.cornerRadius = 20
        popUpView.layer.masksToBounds = true
        backgroundButton.backgroundColor = UIColor.white
        backgroundButton.alpha = 0
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
        timerLabel.text = "00:00"
        timePopUpLabel.text = timerLabel.text
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
        stopButton.isHidden = true
        player.pause()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twop = storyboard.instantiateViewController(withIdentifier: "toTabBar") as! ToTabBarViewControllerNew
//        let alertController = UIAlertController(title: "Health Desk", message:
//            "Great, workout completed", preferredStyle: UIAlertControllerStyle.alert)
//        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action) -> Void in
//        }))
//        self.present(alertController, animated: true, completion: nil)
        self.present(twop, animated: false, completion: nil)
        let defaults = UserDefaults.standard
        let isEndedWorkout = true
        defaults.set(isEndedWorkout, forKey: "isEndedWorkout")
        defaults.synchronize()
    }
    
    @IBAction func resumeAction(_ sender: UIButton) {
        player.play()
        pauseButton.isSelected = false
        pauseButton.isHidden = false
        pauseButton.isEnabled = true
        centerxPopUpView.constant = -400
        backgroundButton.alpha = 0
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
            self.backgroundButton.alpha = 0
        })
        let intervallo :Double = 0.01
        timer = Timer.scheduledTimer(timeInterval: intervallo, target:self, selector: #selector(VideoWorkoutViewController.timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twop = storyboard.instantiateViewController(withIdentifier: "toTabBar") as! ToTabBarViewControllerNew

        timer.invalidate()
        player.pause()
        let defaults = UserDefaults.standard
        let isEndedWorkout = true
        defaults.set(isEndedWorkout, forKey: "isEndedWorkout")
        if defaults.integer(forKey: "counterWorkout") >= 0 {
            var counter = defaults.integer(forKey: "counterWorkout")
            counter += 1
            defaults.set(counter, forKey: "counterWorkout")
        }
        else{
            defaults.set(1, forKey: "counterWorkout")
        }
        defaults.synchronize()
        
        print("***Tempo workout \(minutiD)\(minuti).\(secondiD)\(secondi)")
        let durationWorkout = Double((minutiD * 10 + minuti) * 60 + (secondiD * 10 + secondi))
        let endDate = Date()
        
        //2. Build the workout using data from your Prancercise workout
        let workout = HKWorkout(activityType: .pilates,
                                start: dateStart,
                                end: endDate,
                                duration: durationWorkout,
                                totalEnergyBurned: nil,
                                totalDistance: nil,
                                device: HKDevice.local(),
                                metadata: nil)
        
        //3. Save your workout to HealthKit
        let healthStore = HKHealthStore()
        healthStore.save(workout) { (success, error) in
        }
        
        self.present(twop, animated: false, completion: nil)
    }
    
    
  
    @IBAction func pauseAction(_ sender: UIButton) {
        player.pause()
        pauseButton.isSelected = true
        pauseButton.isHidden = true
        pauseButton.isEnabled = false
        

        centerxPopUpView.constant = 0
        timer.invalidate()
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundButton.alpha = 0.5
        })
    }
    @IBAction func playAction(_ sender: UIButton) {
        dateStart = Date()
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
        
        timerLabel.text = "\(minutiD)\(minuti):\(secondiD)\(secondi)"
        timePopUpLabel.text = timerLabel.text
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
