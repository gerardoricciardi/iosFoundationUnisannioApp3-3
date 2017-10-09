//
//  ViewControllerProfilo.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ViewControllerProfilo: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var BarStretching: UIProgressView!
    @IBOutlet weak var BarYoga: UIProgressView!
    @IBOutlet weak var BarTotalBody: UIProgressView!
    
    let  picker = UIImagePickerController()
    @IBOutlet weak var OrarioLavLabelInizio: UILabel!
    @IBOutlet weak var OrariLavLabel: UILabel!
    @IBOutlet weak var InserireCognomeL: UILabel!
    @IBOutlet weak var InserireNomeL: UILabel!
    @IBOutlet weak var immProfilo: UIImageView!
    @IBOutlet weak var LabelSesso: UILabel!
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
        navigationItem.hidesBackButton = true
        
        
        
        
        // Do any additional setup after loading the view.
//        self.BarStretching.progress=0.0
//        self.BarYoga.progress=0.0
//        self.BarTotalBody.progress=0.0
//        if {
//            self.BarStretching.progress += 0.2
//            defaults.set(self.BarStretching.progress, forKey: "Stretching")
//            defaults.synchronize()
//        }
        defaults.set(self.BarStretching.progress, forKey: "Stretching")
        defaults.synchronize()
        defaults.set(self.BarStretching.progress, forKey: "TotalBody")
        defaults.synchronize()
        defaults.set(self.BarStretching.progress, forKey: "Yoga")
        defaults.synchronize()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("***PROVA viewDidAppear***")
        InserireNomeL?.text = defaults.string(forKey: "name")
        InserireCognomeL?.text = defaults.string(forKey: "surname")
        LabelSesso?.text = defaults.string(forKey: "Sex")
        
        let oraInizio = defaults.object(forKey: "oraInizio")
        let oraFine = defaults.object(forKey: "oraFine")
        
        let calendar = NSCalendar.current
        let oraInComponents = calendar.dateComponents([.hour, .minute], from: oraInizio as! Date)
        let oraOutComponents = calendar.dateComponents([.hour, .minute], from: oraFine as! Date)
        let oraIn = String(describing: oraInComponents.hour!) + ":" + String(describing: oraInComponents.minute!)
        let oraOut = String(describing: oraOutComponents.hour!) + ":" + String(describing: oraOutComponents.minute!)
        
        OrariLavLabel?.text = oraIn
        OrarioLavLabelInizio?.text = oraOut
        
        var counter = Float(defaults.integer(forKey: "counterWorkout"))
                print("***COUNTER \(counter)")
        self.BarStretching?.progress=counter/5.0
        self.BarYoga?.progress = counter/5.0
        self.BarTotalBody?.progress = counter/5.0
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
    }
    
}
