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
        
        view.backgroundColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 49.0)
        _ = UIImage(named: "benvenuto")
        self.picker.delegate = self
        immProfilo.layer.cornerRadius = 30.0
        immProfilo.clipsToBounds = true
        InserireNomeL?.text = "Fabio"//defaults.object(forKey:"Username") as? String
        InserireCognomeL?.text = "Dell'infante"//defaults.object(forKey: "Username") as? String
        LabelSesso?.text = "Uomo"//defaults.object(forKey:"Sesso") as? String
        OrariLavLabel?.text = "09:00"//defaults.object(forKey:"oraInizio") as? String
        OrarioLavLabelInizio?.text = "18:00"//defaults.object(forKey:"oraFine") as? String
        
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
}
