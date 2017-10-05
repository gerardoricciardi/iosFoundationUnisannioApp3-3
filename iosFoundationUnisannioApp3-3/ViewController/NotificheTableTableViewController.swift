//
//  NotificheTableTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Zabatta Daniela on 05/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class NotificheTableTableViewController: UITableViewController {
    
    var notifiche = ["In ufficio","Riepiloghi settimanali","Promemoria"]
    
    var notificheDescrizioni = ["Se l'opzione in ufficio è abilitata, riceverai delle notifiche che ti consentiranno di fare un viaggio nel fitness sul posto di lavoro, attraverso alcuni esercizi da fare comodamente alla scrivania.","Con l'opzione Riepiloghi settimanali, riceverai dei resoconti sugli allenamenti svolti nell'ultima settimana.","L'opzione Promemoria abilitata ti ricorda quando è il momento di allenarsi"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        // #warning Incomplete implementation, return the number of rows
        return notifiche.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellaNotifiche", for: indexPath) as! NotificheTableViewCell
        
        cell.notificheLabel.text = notifiche[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let checkRow = indexPath.row
                if checkRow == 0 {
                    let destinationController = segue.destination as! NotificheTableViewCell
                    destinationController.descrizione = notificheDescrizioni[checkRow]
    
                }
                if checkRow == 1 {
                    let destinationController = segue.destination as! NotificheTableViewCell
                    destinationController.descrizione = notificheDescrizioni[checkRow]
                    
                }
                if checkRow == 2 {
                    let destinationController = segue.destination as! NotificheTableViewCell
                    destinationController.descrizione = notificheDescrizioni[checkRow]
                    
                }
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
