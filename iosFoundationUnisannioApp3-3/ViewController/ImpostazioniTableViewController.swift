//
//  ImpostazioniTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 05/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ImpostazioniTableViewController: UITableViewController {


    var impostazioni = ["Healthkit","Notifiche","Info"]
    var notificheDescrizioni = ["If the option in the office is enabled, you will receive a notifications that will allow you to make a trip to the gym at work, through some exercises to  comfortably at your desk.", "With Weekly Summaries option you will receive reports on the workouts of the last week.", "The option Reminder enabled  reminds you when it's time to train."]
    
    var segue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.red

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
        return impostazioni.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cella", for: indexPath) as! ImpostazioniTableViewCell
        cell.impostazioniLabel.text = impostazioni[indexPath.row]
        tableView.backgroundColor = UIColor.white
        cell.backgroundColor = UIColor.white
        self.tableView.separatorColor = UIColor(red: 55.0/255.0, green: 153.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        
        
    
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select cell")
        if indexPath.row == 0{
            UIApplication.shared.open(URL(string: "x-apple-health://")!)
            
        }
        if indexPath.row == 1{
            //performSegue(withIdentifier: "segueInfo", sender: self)
            if let controllerNotification = navigationController?.storyboard?.instantiateViewController(withIdentifier: "notificheController") as? NotificheTableTableViewController {
                controllerNotification.notificheDescrizioni = notificheDescrizioni
                navigationController?.pushViewController(controllerNotification, animated: true)
            }
        }

        if indexPath.row == 2 {
            //performSegue(withIdentifier: "segueInfo", sender: self)
            if let controller = navigationController?.storyboard?.instantiateViewController(withIdentifier: "infoController") as? InfoViewController {
                
                
        
            navigationController?.pushViewController(controller, animated: true)
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
