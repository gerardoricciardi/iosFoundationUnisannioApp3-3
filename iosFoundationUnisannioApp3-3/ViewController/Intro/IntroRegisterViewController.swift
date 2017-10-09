//
//  IntroRegisterViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 08/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class IntroRegisterViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let background = UIImage(named: "terza")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        registerButton.isEnabled = false
        
        self.nameTF.delegate = self
        self.surnameTF.delegate = self
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        nameTF.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        surnameTF.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
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
        nameTF.inputAccessoryView = toolBar
        surnameTF.inputAccessoryView = toolBar
        emailTF.inputAccessoryView = toolBar
        passwordTF.inputAccessoryView = toolBar
        
        // Do any additional setup after loading the view.
    }
    @objc func didPressDoneButton(button: UIButton) {
        // Button has been pressed
        // Process the containment of the textfield or whatever
        // Hide keyboard
        nameTF.resignFirstResponder()
        surnameTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let name = nameTF.text, !name.isEmpty,
            let surname = surnameTF.text, !surname.isEmpty,
            let email = emailTF.text, !email.isEmpty,
            let password = passwordTF.text, !password.isEmpty
            else {
                registerButton.isEnabled = false
                return
        }
        registerButton.isEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(nameTF.text!, forKey: "name")
        
        defaults.set(surnameTF.text!, forKey: "surname")
        defaults.set(emailTF.text!, forKey: "email")
        defaults.set(passwordTF.text!, forKey: "password")
        defaults.synchronize()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twop = storyboard.instantiateViewController(withIdentifier: "welcome") as! IntroViewControllerBenvenuto
        self.present(twop, animated: false, completion: nil)
    }
    //hide keyboard when user touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
