//
//  Esercizio.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation


enum tipoEsercizio : String{
    case R      // riscaldamento
    case C      //core
    case P      //potenziamento
    case M      //mobilita' articolare
}

class Esercizio {
    var nome : String
    var tipo: tipoEsercizio
    var isPreferito : Bool
    var foto : String    //foto e video potrebbero essere un URL??
    var video : String
    var descrizione: String
    
    init(nome:String, tipo:tipoEsercizio, isPreferito:Bool,foto:String,video:String,descrizione:String){
        self.nome=nome
        self.isPreferito=isPreferito
        self.tipo=tipo
        self.foto=foto
        self.video=video
        self.descrizione=descrizione
        
    }
    
    
}