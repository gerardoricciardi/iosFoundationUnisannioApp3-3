//
//  ViewControllerProfilo.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ViewControllerProfilo: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let  picker = UIImagePickerController()
    
    @IBOutlet weak var OrarioLavLabelInizio: UILabel!
    @IBOutlet weak var OrariLavLabel: UILabel!
    @IBOutlet weak var InserireCognomeL: UILabel!
    @IBOutlet weak var InserireNomeL: UILabel!
    @IBOutlet weak var immProfilo: UIImageView!
    @IBOutlet weak var LabelSesso: UILabel!
    var  u : Utente!
    let defaults = UserDefaults.standard
    
    @IBAction func CambiaImmagineProfilo(_ sender: UIButton) {
        
        
       let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let ChangeImage = UIAlertAction(title: "Cambia Immagine", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.present(self.picker,animated: true,completion: nil)
        })
        
        let  cameraButton = UIAlertAction(title: "Scatta una foto", style: .default, handler: { (action) -> Void in
            print("Delete button tapped")
            self.picker.allowsEditing = false
            self.picker.sourceType = UIImagePickerControllerSourceType.camera
            self.picker.cameraCaptureMode = .photo
            self.picker.modalPresentationStyle = .fullScreen
            self.present(self.picker,animated: true,completion: nil)
            
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        
        alertController.addAction(ChangeImage)
        alertController.addAction(cameraButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        view.backgroundColor = UIColor.white
        _ = UIImage(named: "benvenuto")
        self.picker.delegate = self
        immProfilo.layer.cornerRadius = 30.0
        immProfilo.clipsToBounds = false
        InserireNomeL?.text = defaults.string(forKey: "name")
        InserireCognomeL?.text = defaults.string(forKey: "surname")
        let sex = defaults.string(forKey: "Sex")
        LabelSesso?.text = defaults.string(forKey: "Sex")
        OrariLavLabel?.text = defaults.string(forKey: "oraInizio")
        OrarioLavLabelInizio?.text = defaults.string(forKey: "oraFine")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let immSel = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            immProfilo.contentMode = .scaleAspectFit
            immProfilo.image = immSel
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        
//        defaults.removeObject(forKey: "name")
//        defaults.removeObject(forKey: "surname")
//        defaults.removeObject(forKey: "email")
//        defaults.removeObject(forKey: "password")
//        defaults.synchronize()
    }
    
}
