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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveData(u:Utente){
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let utenti = UtentiMO(context:appDelegate.persistentContainer.viewContext)
            utenti.nome = u.nome
            utenti.cognome = u.cognome
            utenti.email = u.email
            utenti.livelloAttivita = u.livelloAttivita
            utenti.problemi = u.problemi
            utenti.sesso = u.sesso
            utenti.password u.password
            
        }
    }

}

