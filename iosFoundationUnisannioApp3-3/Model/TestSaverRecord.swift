//
//  TestSaverRecord.swift
//  iosFoundationUnisannioApp3-3Tests
//
//  Created by Pagliaro Antonio on 03/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation
import CloudKit
import UIKit
class TestSaverRecord{
    
    
    static func loadExerciseByName(nomeEsercizio : String){
        print("****Load Record*****")
        
        let container = CKContainer.default
        var currentRecord: CKRecord?
        
        var recordZone: CKRecordZone?
        var privateDatabase: CKDatabase?
        
        privateDatabase = container().privateCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let predicate = NSPredicate(format: "%K == %@", "nome", nomeEsercizio)
        
        let query = CKQuery(recordType: "Esercizi", predicate: predicate)
        privateDatabase?.perform(query, inZoneWith: nil) {
            (records, error) -> Void in
            guard let records = records else {
                print("Error querying records: ", error)
                return
            }
            print("Found \(records.count) records matching query")
            
            for record in records{
                print(record.object(forKey:"nome"))
                let fotoEsercizio: CKAsset;
                fotoEsercizio = record.object(forKey: "foto") as! CKAsset
            }
            
            
        }
        
    }
    
    func saveRecord(){
        
        //        print("****Save Record*****")
        
        let container = CKContainer.default
        var currentRecord: CKRecord?
        
        var recordZone: CKRecordZone?
        var privateDatabase: CKDatabase?
        
        privateDatabase = container().privateCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let myRecord = CKRecord(recordType: "Workout",
                                zoneID: (recordZone?.zoneID)!)
        
        myRecord.setObject("yoga" as CKRecordValue, forKey:"categoria")
        //        myRecord.setObject("E858F82D-1D45-4182-AFE4-BF9013136FFD" as CKRecordValue, forKey:"esercizi")
        myRecord.setObject("no" as CKRecordValue, forKey:"isBloccato")
        myRecord.setObject(2 as CKRecordValue, forKey:"livello")
        myRecord.setObject(10 as CKRecordValue, forKey:"tempo")
        
        privateDatabase?.save(myRecord) { (myRecord, error) -> Void in
            guard let record = myRecord else {
                print("Error saving record: ", error)
                return
            }
            print("Successfully saved record: ", record)
        }
        
        
        
    }
    
    
}

