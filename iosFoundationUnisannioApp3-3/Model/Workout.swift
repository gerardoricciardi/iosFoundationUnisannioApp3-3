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
    var esercizi: String?
    var isBloccato: String?
    var livello: Int64?
    var tempo: Int64?
    var video: CKAsset?
    var id: String
    
    init(anteprima: Data, id: String) {
        self.anteprima = anteprima
        self.id = id
    }
    init(anteprima: Data, categoria: String, esercizi: String, isBloccato: String, livello: Int64, tempo: Int64, video: CKAsset, id: String) {
        self.anteprima = anteprima
        self.categoria = categoria
        self.esercizi = esercizi
        self.isBloccato = isBloccato
        self.livello = livello
        self.tempo = tempo
        self.video = video
        self.id = id
    }
}
