//
//  Utente.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation

class Utente{
    
    var livelloAttivita : Int!  // 0=principiante 1=intermedio 2=esperto
    var sesso : Bool!      //true= female false= male
    var problemi: Int!  // 0= benessere 1=prob1 2=prob2 3=prob3
    var nome,cognome,email,password : String!
        
    init(nome:String,cognome : String, email : String, password : String){
        self.nome=nome
        self.cognome=cognome
            self.email=email
            self.password=password
        }
    
    
    init(nome:String,cognome : String, email : String, password : String,livelloAttivita : Int, sesso : Bool, problemi: Int){
        self.nome=nome
        self.cognome=cognome
        self.email=email
        self.password=password
        self.livelloAttivita=livelloAttivita
        self.sesso=sesso
        self.problemi=problemi
    }
    
    
    
    }
    

