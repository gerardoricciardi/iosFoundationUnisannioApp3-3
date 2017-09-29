//
//  ViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 26/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

var prova =  "Prova"
class ViewController: UIViewController {
    
    
    @IBAction func password(_ sender: UITextField) {
        
    }
    @IBAction func usurname(_ sender: UITextField) {
    }
    
    @IBAction func mail(_ sender: UITextField) {
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      let  e=Esercizio(nome:"Skip",tipo:"Riscaldamento",foto:"url....",video:"url....",descrizione:"bla bla")
        
        EsercizioDAO.saveEsercizio(ese: e)
        
        EsercizioDAO.fetchEsercizi()
        label.text = "Benvenuto"
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "rtg")!)
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "2")!)
        //button.backgroundColor = UIColor.gray
        
        var titolo = self.storyboard?.description
        titolo = self.storyboard?.value(forKey: "name") as! String
        print(titolo)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    func saveUtente(u:Utente){
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let utenti = UtentiMO(context:appDelegate.persistentContainer.viewContext)
            utenti.nome = u.nome
            utenti.cognome = u.cognome
            utenti.email = u.email
            utenti.livelloAttivita = Int32(u.livelloAttivita)
            //utenti.problemi = u.problemi
            utenti.sesso = u.sesso
            utenti.password = u.password
            
            appDelegate.saveContext()
            
            
        }
    }

}

