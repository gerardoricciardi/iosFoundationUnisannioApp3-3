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
        var publicDatabase: CKDatabase?
        
        publicDatabase = container().publicCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let predicate = NSPredicate(format: "%K == %@", "nome", nomeEsercizio)
        
        let query = CKQuery(recordType: "Esercizi", predicate: predicate)
        publicDatabase?.perform(query, inZoneWith: nil) {
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
        var publicDatabase: CKDatabase?
        
        publicDatabase = container().publicCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let myRecord = CKRecord(recordType: "Workout",
                                zoneID: (recordZone?.zoneID)!)
        
        myRecord.setObject("yoga" as CKRecordValue, forKey:"categoria")
        //        myRecord.setObject("E858F82D-1D45-4182-AFE4-BF9013136FFD" as CKRecordValue, forKey:"esercizi")
        myRecord.setObject("no" as CKRecordValue, forKey:"isBloccato")
        myRecord.setObject(2 as CKRecordValue, forKey:"livello")
        myRecord.setObject(10 as CKRecordValue, forKey:"tempo")
        
        publicDatabase?.save(myRecord) { (myRecord, error) -> Void in
            guard let record = myRecord else {
                print("Error saving record: ", error)
                return
            }
            print("Successfully saved record: ", record)
        }
        
    }
    
    //fare metodo getEserciziByworkout
    
    
    static func getVideoFromEsercizio(nomeEsercizio:String)->Data{
        let semaphore = DispatchSemaphore(value: 0)

        
       var videoData:Data!
        let container = CKContainer.default
        var currentRecord: CKRecord?
        var recordZone: CKRecordZone?
        var publicDatabase: CKDatabase?
        
        publicDatabase = container().publicCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let predicate = NSPredicate(format: "%K == %@", "nome", nomeEsercizio)
        
        let query = CKQuery(recordType: "Esercizi", predicate: predicate)
        publicDatabase?.perform(query, inZoneWith: nil) {
            (records, error) -> Void in
            guard let records = records else {
                print("Error querying records: ", error)
                return
            }
            print("Found \(records.count) records matching query")
            for record in records{
                var File : CKAsset? = record.object(forKey:"video") as! CKAsset
                print(record.object(forKey: "nome")!)
                
                if let file = File {
                    if let data = try?Data(contentsOf: file.fileURL) {
                        videoData=data
                        
                        semaphore.signal()

                        
                    }
                }
                
                
            }
            
        }
        
        
        semaphore.wait()
        return videoData
        

}
    
    
    static func getWorkoutsByCategory(categoria:String)->[Workout]{
        
        print("***metodo get WORKOUTBYCATEGORY***")
        let semaphore = DispatchSemaphore(value: 0)

    var workouts : [Workout]=[Workout]()
        var videoData:Data!
        let container = CKContainer.default
        var currentRecord: CKRecord?
        var recordZone: CKRecordZone?
        var publicDatabase: CKDatabase?
        
        publicDatabase = container().publicCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        let predicate = NSPredicate(format: "%K == %@", "categoria", categoria)
        
        let query = CKQuery(recordType: "Workout", predicate: predicate)
        publicDatabase?.perform(query, inZoneWith: nil) {
            (records, error) -> Void in
            guard let records = records else {
                print("Error querying records: ", error)
                return
            }
            print("Found \(records.count) records matching query")
            for record in records{
                
                print("***WO categoria= "+String(describing: record.object(forKey: "categoria")!))
                
                var idWorkout : CKRecordID=record.recordID as! CKRecordID
//                print(idWorkout)
                var File : CKAsset?=record.object(forKey: "anteprima") as! CKAsset
//                print(File)
                
                
                var anteprima : Data!
                
                if let file = File {
                    if let data = try?Data(contentsOf: file.fileURL) {
                        anteprima=data
                        
                    }
                }
                
                let workout:Workout=Workout(anteprima:anteprima,id:idWorkout)
                
                
                workouts.append(workout)
                print("Count workouts "+String(workouts.count))
//                semaphore.signal()
                
            }
            semaphore.signal()
        
    }
//        semaphore.signal()
        
        semaphore.wait()
        return workouts
}
    
    
    static func getWorkoutDetailsById(id:CKRecordID)->Workout{
        print("***metodo getWorkoutByID***")

        
        let semaphore = DispatchSemaphore(value: 0)
        
        var workout:Workout!
        
        var videoData:Data!
        let container = CKContainer.default
        var currentRecord: CKRecord?
        var recordZone: CKRecordZone?
        var publicDatabase: CKDatabase?
        var record:CKRecord?
        
        publicDatabase = container().publicCloudDatabase
        recordZone = CKRecordZone(zoneName: "_defaultZone")
        
        
        publicDatabase?.fetch(withRecordID: id) { (myrecord, error) -> Void in
            guard let myrecord = myrecord else {
                print("Error fetching record: ", error)
                return
            }
            print("Successfully fetched record: ", myrecord)
            
            record=myrecord
            semaphore.signal()
            
        }

        semaphore.wait()
                var anteprima : Data!
        var categoria : String=record!.object(forKey: "categoria") as! String
        var isBloccato: String=record!.object(forKey: "isBloccato") as! String
        var tempo: Int64=record!.object(forKey: "tempo") as! Int64
        var livello: Int64=record!.object(forKey: "livello") as! Int64
                var video : Data!
                var esercizi : [CKRecordID]=[CKRecordID]()
                var eserciziWorkout:[Esercizio]=[Esercizio]()
        var idWorkout : CKRecordID=record!.recordID

                
        var fileAnteprima:CKAsset?=record?.object(forKey:"anteprima") as! CKAsset
        var fileVideo:CKAsset?=record?.object(forKey:"video") as! CKAsset

                
                if let file = fileAnteprima {
                    if let data = try?Data(contentsOf: file.fileURL) {
                        anteprima=data
                        
                    }
                }
        
                
                if let file = fileVideo {
                    if let data = try?Data(contentsOf: file.fileURL) {
                        video=data
                        
                    }
                }
                
                workout=Workout(anteprima: anteprima,categoria: categoria,esercizi: eserciziWorkout,isBloccato: isBloccato,livello: livello,tempo: tempo,video: video,id: idWorkout)
                
                
        for esercizioReference in record!["esercizi"] as! [CKReference] {
                    esercizi.append(esercizioReference.recordID)
                }
        
                var fetchOperation = CKFetchRecordsOperation(recordIDs: esercizi)
                fetchOperation.fetchRecordsCompletionBlock = {
                    records, error in
                    if error != nil {
                        print("\(error!)")
                    } else {
                        for (recordId, record) in records! {
                            var nome:String=record.object(forKey: "nome") as! String
                            var descrizione:String=record.object(forKey: "descrizione") as! String
                            var foto:Data!
                            var fotoEsercizio:CKAsset?=record.object(forKey:"foto") as! CKAsset
                            
                            if let file = fotoEsercizio {
                                if let data = try?Data(contentsOf: file.fileURL) {
                                    foto=data
                                    
                                }
                            }
                            var  esercizio : Esercizio=Esercizio(nome:nome,descrizione:descrizione, foto:foto)
                            
                            print("*****Esercizio nome: "+String(esercizio.nome))
//                            workout.esercizi.append(esercizio)
                            workout.addEsercizio(esercizio: esercizio)
                            
                        }
                        
                    }
                }
                CKContainer.default().publicCloudDatabase.add(fetchOperation)
        semaphore.signal()


        
        semaphore.wait()
        return workout
            
        }

    
        

        
        
    }
    
    
    
    





