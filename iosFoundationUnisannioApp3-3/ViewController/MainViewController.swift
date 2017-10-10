//
//  MainViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import HealthKit

class MainViewController: UIViewController {

    var segueTabBar = "tabBar"
    var segueFirstView = "intro"
    
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
//        if defaults.string(forKey: "scrivi Username") != nil || defaults.bool(forKey: "isEndedWorkout"){
        if defaults.string(forKey: "name") != nil {
            //utente gia presente, vai alla tabbar
            print("Sono nel main chiave username trovata")
            defaults.set("noSkip", forKey: "skip")
            segueFirstView = segueTabBar
        }
        else{
            //non ci sta nessuno vai all introduzione
            defaults.set("skip", forKey: "skip")
            if defaults.string(forKey: "skip") == "skip"{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat =  "HH:mm"
                
                let oraInizio = dateFormatter.date(from: "09:00")!
                let oraFine = dateFormatter.date(from: "17:00")!
                defaults.set(oraInizio, forKey: "oraInizio")
                defaults.set(oraFine, forKey: "oraFine")
                defaults.set("Name", forKey: "name")
                defaults.set("Surname", forKey: "surname")
                defaults.set("default", forKey: "Sex")
                
            }
            print("Sono nel main chiave username non trovata")
        }
        
        //self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "1")!)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TestSaverRecord.loadExerciseByName(nomeEsercizio: "OHS")
        
        let background = UIImage(named: "rtg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        
        authorizeHealthKit()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm"
        
        var day = "2017-10-05T17:00"
        var dayEnd = "2017-10-05T17:10"
        
        let dateIn = dateFormatter.date(from: "2017-10-03T19:00")
        let dateOut = dateFormatter.date(from: "2017-10-03T19:15")
        
        
        
        //2. Build the workout using data from your Prancercise workout
        let workout = HKWorkout(activityType: .gymnastics,
                                start: dateIn!,
                                end: dateOut!,
                                duration: (dateIn?.timeIntervalSince(dateOut!))!,
                                totalEnergyBurned: nil,
                                totalDistance: nil,
                                device: HKDevice.local(),
                                metadata: nil)
        
        //3. Save your workout to HealthKit
        let healthStore = HKHealthStore()
        healthStore.save(workout) { (success, error) in
        }
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
    }
    private func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            guard authorized else {
                let baseMessage = "HealthKit Authorization Failed"
                if let error = error {
                    print("\(baseMessage). Reason: \(error.localizedDescription)")
                } else {
                    print(baseMessage)
                }
                return
            }
            print("HealthKit Successfully Authorized.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Controlla se ci sono i dati dell utente, vai alla tabView
         altrimenti fai l'introduzione
         */
        
        // Do any additional setup after loading the view.
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: segueFirstView, sender: self)
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
