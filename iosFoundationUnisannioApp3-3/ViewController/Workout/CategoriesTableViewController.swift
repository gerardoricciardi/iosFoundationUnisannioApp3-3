//
//  CategoriesTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import UserNotifications

class CategoriesTableViewController: UITableViewController, UNUserNotificationCenterDelegate {
    var isGrantedNotificationAccess:Bool = false
    
    let backgroundColor = UIColor(red: 54.0/255.0, green: 155.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    var categoriesImage = ["stretching", "pilates", "totalBody"]
    var categoriesTitle = ["Stretching", "Pilates", "TotalBody"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = backgroundColor
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
        }
        )
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func createNotification() {
        if isGrantedNotificationAccess{
            //add notification code here
            print("*****Prova Notifica******")
            // unMutableNotificationContent contiene tutto il contenuto della notifica
            //Set the content of the notification
            let content = UNMutableNotificationContent()
            //            content.title = "Prenditi cura di te stesso"
            content.subtitle = "Esercizio da fare in ufficio"
            content.body = "Siediti sulla punta della sedia e stendi le gambe, inclinati con il busto in avanti cercando di toccare le caviglie"
            content.sound = UNNotificationSound.default()
            
            // triggers sono gli eventi che hanno scatenato la notifica
            // per notifiche locali ci sono triggers per times, dates and locations
            // usiamo le notifiche per times, repeats ci consente di ripetere la stessa notifica NEW from ios10
            //Set the trigger of the notification -- here a timer.
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 10.0,
                repeats: false)
            
            var dateComponents = DateComponents()
            dateComponents.hour = 17
            dateComponents.minute = 15
            let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            // prendiamo il trigger, il content e aggiungiamo una stringa per identificare la notifica
            // inseriamo tutto in request
            //Set the request for the notification from the above
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: trigger)
            //Add the notification to the currnet notification center
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
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
        if segue.identifier == "showCategories"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! CategoriesDetailsViewController
                // destinationController.restaurantName = immagini[indexPath.row]
                //destinationController.locationName = location[indexPath.row]
                //destinationController.typeName = type[indexPath.row]
                //destinationController.ristorante = ristoranti[indexPath.row]
                destinationController.thumb = categoriesImage[indexPath.row]
                
            }
        }
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

