//
//  IntroViewController1.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

//ViewController per inserire dati utente

class IntroViewController1: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTF.delegate = self
        
        let background = UIImage(named: "terza")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        
       
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
       
    
    
        

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //usernameTF.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        //salva in let defaults = UserDefaults.standard le tre label
        //e va alla view successiva
        
        let username:String = usernameTF.text!
        let password:String = passwordTF.text!
        let email:String = emailTF.text!
  
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "Username")
        defaults.set(password, forKey: "Password")
        defaults.set(email, forKey: "Email")
        defaults.synchronize()
        
//        verifica del salvataggio in defaults dei dati dalle label
//        print(defaults.string(forKey: "Username"))
//        print(defaults.string(forKey: "Password"))
//        print(defaults.string(forKey: "Email"))
        
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
