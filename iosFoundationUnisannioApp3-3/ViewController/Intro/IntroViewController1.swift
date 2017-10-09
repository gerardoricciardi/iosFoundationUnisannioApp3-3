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
//    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.usernameTF.delegate = self
        
        let background = UIImage(named: "terza")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        
        
    
        // Create toolBar
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        //toolBar.isTranslucent = true
        //toolBar.isOpaque = true
        
        // Add buttons as `UIBarButtonItem` to toolbar
        // First add some space to the left hand side, so your button is not on the edge of the screen
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil) // flexible space to add left end side
        
        // Create your first visible button
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(didPressDoneButton))
        // Note, that we declared the `didPressDoneButton` to be called, when Done button has been pressed
        toolBar.items = [flexsibleSpace, doneButton]
        
        // Assing toolbar as inputAccessoryView
       // usernameTF.inputAccessoryView = toolBar
        emailTF.inputAccessoryView = toolBar
        passwordTF.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }

   
    @objc func didPressDoneButton(button: UIButton) {
        // Button has been pressed
        // Process the containment of the textfield or whatever
        // Hide keyboard
//        usernameTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    //hide keyboard when user touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //presses return key
    //quando premi sul return key va alla prossima textField (da fare)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //usernameTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        //salva in let defaults = UserDefaults.standard le tre label
        //e va alla view successiva
        
        //let username:String = usernameTF.text!
        let password:String = passwordTF.text!
        let email:String = emailTF.text!
  
        let defaults = UserDefaults.standard
//        defaults.set(username, forKey: "username")
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
