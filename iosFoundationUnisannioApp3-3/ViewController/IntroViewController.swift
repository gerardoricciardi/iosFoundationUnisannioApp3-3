//
//  ViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 26/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import HealthKit
import AVKit
import AVFoundation

class IntroViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      let  e=Esercizio(nome:"Skip",tipo:"Riscaldamento",foto:"url....",video:"url....",descrizione:"bla bla")
//        EsercizioDAO.saveEsercizio(ese: e)
//        EsercizioDAO.fetchEsercizi()
        
        //label.text = "Benvenuto"
        //self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "rtg")!)
        //self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "1")!)
        
        let background = UIImage(named: "terza")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        
        //2. Build the workout using data from your Prancercise workout
        let workout = HKWorkout(activityType: .other,
                                start: Date.init(timeIntervalSinceNow: TimeInterval.init(exactly: 5)!),
                                end: Date.init(timeIntervalSinceNow: TimeInterval.init(exactly: 10)!),
                                duration: Date.init(timeIntervalSinceNow: TimeInterval.init(exactly: 10)!).timeIntervalSince(Date.init(timeIntervalSinceNow: TimeInterval.init(exactly: 5)!)),
                                totalEnergyBurned: nil,
                                totalDistance: nil,
                                device: HKDevice.local(),
                                metadata: nil)
        
        //3. Save your workout to HealthKit
        let healthStore = HKHealthStore()
        healthStore.save(workout) { (success, error) in
        }
        
/*
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
        player.pause()
 */
    }

   
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
//    func saveUtente(u:Utente){
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
//            let utenti = UtentiMO(context:appDelegate.persistentContainer.viewContext)
//            utenti.nome = u.nome
//            utenti.cognome = u.cognome
//            utenti.email = u.email
//            utenti.livelloAttivita = Int32(u.livelloAttivita)
//            //utenti.problemi = u.problemi
//            utenti.sesso = u.sesso
//            utenti.password = u.password
//            
//            appDelegate.saveContext()
//            
//            
//        }
//    }

}

