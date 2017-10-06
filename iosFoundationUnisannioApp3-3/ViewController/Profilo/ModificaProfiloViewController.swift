//
//  ModificaProfiloViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 06/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ModificaProfiloViewController: UIViewController {
    @IBOutlet weak var orarioFineP: UIDatePicker!
    @IBOutlet weak var orarioInizioP: UIDatePicker!
    let defaults=UserDefaults.standard
    
    @IBAction func WomanButton(_ sender: UIButton) {
        defaults.set("donna", forKey: "Sesso")
        defaults.synchronize()
        print("donna")
    }
    @IBAction func ManButton(_ sender: UIButton) {
        defaults.set("uomo", forKey: "Sesso")
        defaults.synchronize()
        print("uomo")
    }
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        defaults.set(orarioInizioP.date, forKey: "oraInizio")
        defaults.set(orarioFineP.date, forKey: "oraFine")
        defaults.synchronize()
        print("Tutto registrato")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
