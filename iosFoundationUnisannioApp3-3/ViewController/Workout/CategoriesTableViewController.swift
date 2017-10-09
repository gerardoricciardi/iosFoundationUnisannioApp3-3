//
//  CategoriesTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import UserNotifications
import CloudKit

class CategoriesTableViewController: UITableViewController, UNUserNotificationCenterDelegate {
    var isGrantedNotificationAccess:Bool = false
    
    let backgroundColor = UIColor(red: 54.0/255.0, green: 155.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    var categoriesImage = ["stretching", "pilates", "totalBody"]
    var categoriesTitle = ["stretching", "pilates", "totalBody"]
    var notifiche: [NotificationHK] = []
    var id = ""
    var notifica1 = NotificationHK(title: "Esercizio da fare in ufficio", body: "Siediti sulla punta della sedia e stendi le gambe, inclinati con il busto in avanti cercando di toccare le caviglie", id: "String", hour: 13, minute: 30)
    var notifica2 = NotificationHK(title: "Move!", body: "Alzarsi per prendere un bicchiere d’acqua", id: "String", hour: 13, minute: 35)
    
    var notifica3 = NotificationHK(title: "Countdown", body: "Prova notifica timer", id: "", timer: 10.0)
  
    
    var activityIndicator : UIActivityIndicatorView=UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = backgroundColor
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
        }
        )
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        notifica1.id = id
        notifiche.append(notifica1)
        notifiche.append(notifica2)
        notifiche.append(notifica3)
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func createNotification() {
        if isGrantedNotificationAccess{
           
            for notifica in notifiche{
                //add notification code here
                // unMutableNotificationContent contiene tutto il contenuto della notifica
                //Set the content of the notification
                let content = UNMutableNotificationContent()
                content.title = notifica.title
                //            content.subtitle = "Esercizio da fare in ufficio"
                content.body = notifica.body
                content.sound = UNNotificationSound.default()
                // triggers sono gli eventi che hanno scatenato la notifica
                // per notifiche locali ci sono triggers per times, dates and locations
                // usiamo le notifiche per times, repeats ci consente di ripetere la stessa notifica NEW from ios10
                //Set the trigger of the notification -- here a timer.
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: notifica.timer,
                    repeats: false)
                
                
                var dateComponents = DateComponents()
                dateComponents.hour = notifica.hour
                dateComponents.minute = notifica.minute
                let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.mm.yyyy'T'HH:mm:ss:mmZZZZZ"
                var result = formatter.string(from: date)
                result.append(notifica.title)
                print(result)
                
                // prendiamo il trigger, il content e aggiungiamo una stringa per identificare la notifica
                // inseriamo tutto in request
                //Set the request for the notification from the above
                var request = UNNotificationRequest(
                    identifier: result,
                    content: content,
                    trigger: trigger)
                
                if notifica.check{
                    request = UNNotificationRequest(
                        identifier: result,
                        content: content,
                        trigger: trigger1)
                }
                
                //Add the notification to the currnet notification center
                UNUserNotificationCenter.current().add(
                    request, withCompletionHandler: nil)
            
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        createNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesImage.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesTableViewCell
        
        print("indexPath.row \(indexPath.row)")
        cell.categoriesImage.image = UIImage(named: categoriesImage[indexPath.row])
        cell.categoriesLabel.text = categoriesTitle[indexPath.row]
        
        cell.backgroundColor = backgroundColor
        // Configure the cell...
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var workouts:[Workout]!
        if segue.identifier == "showCategories"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! DetailsCategoriesTableViewController
//                dammi i workout disponibili per la categoria scelta
//                 e passali alla view successiva
                
//
//                activityIndicator.center=view.center
//                activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.whiteLarge
//                view.addSubview(activityIndicator)
//
//                activityIndicator.startAnimating()
                
              var  categoria : String
                categoria=categoriesTitle[indexPath.row]
                print(categoria)
                 let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        
//                workouts = TestSaverRecord.getWorkoutsByCategory(categoria:categoria)
                
                workouts=getWorkoutsByCategory(categoria: categoria)
                destinationController.workouts=workouts

            }
        }
    }
    
    
     func getWorkoutsByCategory(categoria:String)->[Workout]{
        
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

