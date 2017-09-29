//
//  EsercizioDAO.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 29/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EsercizioDAO{
    
  static  func saveEsercizio(ese : Esercizio){
        if let appDelegate = ( UIApplication.shared.delegate as? AppDelegate){
            let esercizio = NSEntityDescription.insertNewObject(forEntityName: "Esercizio", into: appDelegate.persistentContainer.viewContext) as! EsercizioMO
            esercizio.nome=ese.nome
            esercizio.tipo=ese.tipo
            esercizio.foto=ese.foto
            esercizio.video=ese.video
            esercizio.descrizione=ese.descrizione
            
            appDelegate.saveContext()

        }
    }
    
    
  static  func fetchEsercizi(){
        if let appDelegate = ( UIApplication.shared.delegate as? AppDelegate){
            let request: NSFetchRequest<EsercizioMO> = EsercizioMO.fetchRequest()
        let moc=appDelegate.persistentContainer.viewContext
        do {
            let esercizi = try moc.fetch(request) 
            for esercizio in esercizi{
                print("Nome esercizio: " + esercizio.nome!)
                print("tipo esercizio: " + esercizio.tipo!)
                print("foto esercizio: " + esercizio.foto!)
                print("video esercizio: " + esercizio.video!)
                print("descrizione esercizio: " + esercizio.descrizione!)
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    }
}
