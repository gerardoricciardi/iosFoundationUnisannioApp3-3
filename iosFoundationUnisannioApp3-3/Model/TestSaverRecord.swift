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
    
    
    static func loadExerciseFotoByName(nomeEsercizio : String) -> UIImage{
        print("****Load Record*****")
        var image:UIImage!
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
                print(record.object(forKey:"nome")!)
                
                
                guard let asset = record["foto"] as? CKAsset else {
                    print("Image missing from record")
                    return
                }
                
                guard let imageData = try?Data(contentsOf: asset.fileURL) else {
                    print("Invalid Image")
                    return
                }
                
                 image = UIImage(data: imageData)
  
            }

        
    }
        
        return image
    }
    
    // fare un metodo che si prende tutti gli esercizi
//    e fa vedere una lista di immagini
//   si fa prendendo la foto come asset, poi si fa da asset a url e da url a uiimage
    
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
    
    //fare metodo getEserciziByworkout
    
    
    static func getVideoFromEsercizio(nomeEsercizio:String)->URL{
        var urlVideo : URL!
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
//            print("Found \(records.count) records matching query")
            for record in records{
                var File : CKAsset? = record.object(forKey:"video") as! CKAsset
            
            
                if let file = File {
                    if let data = try?Data(contentsOf: file.fileURL) {
                        urlVideo=file.fileURL
                    }
                }
//                return urlVideo
            
            }

    }
        while urlVideo==nil{
            
        }
        print(urlVideo)
    return urlVideo
    


    }
}




