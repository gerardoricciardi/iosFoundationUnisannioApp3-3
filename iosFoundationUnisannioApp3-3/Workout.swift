//
//  Workout.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation

enum Giudizio: Int{
    case uno=1,due,tre,quattro,cinque   //dichiarazione implicita due=2 etc.....
}

enum TipoWorkout:String{
    case TotalBody
    case Pilates
    case Stretching
}

class Workout{      //per ora non e' previsto un id univoco
    var tempo:Double
    var data : Date //vedere gestione classe Date
    var isSvolto: Bool
    var esercizi : [Esercizio]
    var giudizio:Giudizio
    var tipoWorkout : TipoWorkout
    
    init(tempo:Double,data:Date,isSvolto:Bool,esercizi:[Esercizio],giudizio:Giudizio,tipoWorkout:TipoWorkout){
        self.tempo=tempo
        self.data=data
        self.isSvolto=isSvolto
        self.esercizi=[Esercizio]()
        self.giudizio=giudizio
        self.tipoWorkout=tipoWorkout
        
    }
}
