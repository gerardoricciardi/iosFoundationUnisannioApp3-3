//
//  Utente.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 27/09/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation

class Utente{
    
    var livelloAttivita : Int  // 0=principiante 1=intermedio 2=esperto
    var sesso : Bool        //true= female false= male
    var problemi: Int   // 0= benessere 1=prob1 2=prob2 3=prob3
    
    var nome : String{
        get{
            return self.nome
        }
        set(nome){
            self.nome=nome
        }
    }
    
    var cognome : String{
        get{
            return self.cognome
        }
        set(cognome){
            self.cognome=cognome
        }
    }
    var email : String{
        get{
            return self.email
        }
        set(email){
            self.email=email
        }
    }
    var password : String{
        get{
            return self.password
        }
        set(password){
            self.password=password
        }
        
        init(String : nome,String : cognome, String :email, String : password)
        
    }
    
}
