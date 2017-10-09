//
//  Workout.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//
import Foundation
import CloudKit
import UIKit

class Workout{
    
    var anteprima: Data?
    var categoria: String?
    var esercizi: [Esercizio]=[Esercizio]()
    var isBloccato: String?
    var livello: Int64?
    var tempo: Int64?
    var video: Data?
    var id: CKRecordID?
    
    init(anteprima: Data, id: CKRecordID) {
        self.anteprima = anteprima
        self.id = id
    }
    
    init(anteprima: Data, categoria: String, esercizi: [Esercizio], isBloccato: String, livello: Int64, tempo: Int64, video: Data, id: CKRecordID) {
        self.anteprima = anteprima
        self.categoria = categoria
        self.esercizi = [Esercizio]()
        self.isBloccato = isBloccato
        self.livello = livello
        self.tempo = tempo
        self.video = video
        self.id = id
    }
    
    
    func addEsercizio(esercizio:Esercizio){
        
        self.esercizi.append(esercizio)
        print("ESercizi count "+String(esercizi.count))
        print("Workout->esercizio nome"+String(esercizio.nome))
        print("Workout->esercizio descrizione"+String(esercizio.descrizione))
        

    }
    
    func getEsercizi()->[Esercizio]{
        print("ESERCIZI GETESERCIZI count "+String(esercizi.count))

        return self.esercizi
    }
}
