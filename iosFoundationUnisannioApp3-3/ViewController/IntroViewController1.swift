//
//  IntroViewController1.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

//ViewController per inserire dati utente

class IntroViewController1: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        //salva in let defaults = UserDefaults.standard le tre label
        //e va alla view successiva
        
        let username:String = usernameLabel.text!
        let password:String = passwordLabel.text!
        let email:String = emailLabel.text!
  
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "Username")
        defaults.set(password, forKey: "Password")
        defaults.set(email, forKey: "Email")
        defaults.synchronize()
        
//        verifica del salvataggio in defaults dei dati dalle label
//        print(defaults.string(forKey: "Username"))
//        print(defaults.string(forKey: "Password"))
//        print(defaults.string(forKey: "Email"))
        
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }


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
