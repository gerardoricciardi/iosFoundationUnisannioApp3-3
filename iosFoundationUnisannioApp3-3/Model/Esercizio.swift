//
//  Esercizio.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation


//enum tipoEsercizio{
//    case R      // riscaldamento
//    case C      //core
//    case P      //potenziamento
//    case M      //mobilita' articolare
//}

class Esercizio {
    var nome : String!
    var tipo: String!
    var foto : Data!
    var video : Data!
    var descrizione: String!
    
    init(nome:String, tipo:String,foto:Data,video:Data,descrizione:String){
        self.nome=nome
        
        self.tipo=tipo
        self.foto=foto
        self.video=video
        self.descrizione=descrizione
        
    }
    
    init(nome:String,descrizione:String,foto:Data){
        self.nome=nome
        self.descrizione=descrizione
        self.foto=foto

    }
    
    
}
