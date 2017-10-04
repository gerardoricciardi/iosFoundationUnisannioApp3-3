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
    @IBOutlet weak var InserireCognomeL: UILabel!
    @IBOutlet weak var InserireNomeL: UILabel!
    
    @IBOutlet weak var immProfilo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        immProfilo.layer.cornerRadius = 30.0
        immProfilo.clipsToBounds = true
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let immSel = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            immProfilo.contentMode = .scaleAspectFit
            immProfilo.image = immSel
        }
        dismiss(animated: true, completion: nil)
    }
}
