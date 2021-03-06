//
//  TableViewControllerModificaProfilo.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 04/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class TableViewControllerModificaProfilo: UITableViewController {

    
    
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
        return 2
    }
  /*  orarioInizio.minuteInterval = Int(10)
    orarioFine.minuteInterval = Int(10)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat =  "HH:mm"
    
    let dateIn = dateFormatter.date(from: "9:00")
    let dateOut = dateFormatter.date(from: "17:00")
    
    orarioInizio.date = dateIn!
    orarioFine.date = dateOut!*/
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.row == 0
       {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellModificaProfilo", for: indexPath) as! ModificaProfiloTableViewCell
            
            let dateFormatte = DateFormatter()
            dateFormatte.dateFormat =  "HH:mm"
            let dateIn = dateFormatte.date(from: "9:00")
            let dateOut = dateFormatte.date(from: "17:00")
            
            cell.OraInizio.date = dateIn!
            cell.OraFine.date = dateOut!
        
            
            
            return cell
        }
        else
      {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellModificaProfilo1", for: indexPath) as! ModificaProfiloTableViewCell
                
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250.0
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
