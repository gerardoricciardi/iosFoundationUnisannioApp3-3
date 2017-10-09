//
//  ModificaProfilo2ViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 07/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ModificaProfilo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.hidesBackButton = true
        self.title = "Edit"
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        orarioInizioP.minuteInterval = Int(10)
        orarioFineP.minuteInterval = Int(10)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        
        let oraInizio = defaults.object(forKey: "oraInizio")
        let oraFine = defaults.object(forKey: "oraFine")
        
        let calendar = NSCalendar.current
        let oraInComponents = calendar.dateComponents([.hour, .minute], from: oraInizio as! Date)
        let oraOutComponents = calendar.dateComponents([.hour, .minute], from: oraFine as! Date)
        let oraIn = String(describing: oraInComponents.hour!) + "." + String(describing: oraInComponents.minute!)
        let oraOut = String(describing: oraOutComponents.hour!) + "." + String(describing: oraOutComponents.minute!)
        
        
        
        let dateIn = dateFormatter.date(from: oraIn)
        let dateOut = dateFormatter.date(from: oraOut)
        
        orarioInizioP.date = dateIn!
        orarioFineP.date = dateOut!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var orarioFineP : UIDatePicker!
    @IBOutlet weak var orarioInizioP : UIDatePicker!
    let defaults=UserDefaults.standard
    
    @IBAction func WomanButton(_ sender: UIButton) {
        defaults.set("Female", forKey: "Sex")
        defaults.synchronize()
        print("donna")
    }
    @IBAction func ManButton(_ sender: UIButton) {
        defaults.set("Male", forKey: "Sex")
        defaults.synchronize()
        print("uomo")
    }
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        defaults.set(orarioInizioP.date, forKey: "oraInizio")
        defaults.set(orarioFineP.date, forKey: "oraFine")
        defaults.synchronize()
        print("Tutto registrato")
        let popOverVC = UIStoryboard(name:"Utente", bundle: nil).instantiateViewController(withIdentifier: "sdPopUpID") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
