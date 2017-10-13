//
//  TableViewControllerPreviewAllenamento.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 05/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit
import CloudKit

class TableViewControllerPreviewAllenamento: UITableViewController {

  var workout : Workout!
    var esercizi: [Esercizio]=[]
    var id :CKRecordID!
    var wait = true
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//        self.tabBarController?.tabBar.isHidden = false
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = UIImageView.init(image: UIImage(named:"benvenuto"))
        //        self.tableView.backgroundView(UIImageView.init(image: UIImage(named: "benvenuto")))
        //        self.tableView.backgroundView = UIImageView.init(image: UIImage(named: "benvenuto"))
        //        self.tableView.addSubview(UIImageView.init(image: UIImage(named: "benvenuto")))
        var activityIndicator : UIActivityIndicatorView=UIActivityIndicatorView()
        activityIndicator.center=tableView.center
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.whiteLarge
        tableView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        self.tableView.tableFooterView = nil
        self.tableView.separatorStyle = .none
        
        
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        concurrentQueue.async {
            self.workout = TestSaverRecord.getWorkoutDetailsById(id: self.id)
        }
        concurrentQueue.async(flags: .barrier){
            
            self.esercizi=self.workout.getEsercizi()

            self.wait = false
            activityIndicator.stopAnimating()
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
            self.tableView.reloadData()
        }
        
        

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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if wait {
            return 0
        }else{
            if section == 0{
                return 1
            }
            else{
                if esercizi.isEmpty{
                    return 0
                }
                else{
                    print("*************count esercizi"+String(self.esercizi.count))
                    return self.esercizi.count
                }
            }
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return CGFloat(300)
        }
        else{
            return CGFloat(110)
        }

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPreviewVideo", for: indexPath) as! TableViewCellPreviewVideo

//        cell.imageAnteprima.image=UIImage(named:"stretching") //bisogna mettere anteprimaVideo da DB

            cell.imageAnteprima.image=UIImage(data:workout.anteprima!)
            
            
            
            
        return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPreviewEsercizi", for: indexPath) as! TableViewCellPreviewEsercizi
            
            //            cell.imageEsercizio.image=UIImage(named:"stretching")
            //            cell.labelNomeEsercizio.text="Esercizio 1"
            //            cell.labelDescrizione.text="Esercizio per migliorare......"
            //
            
            
            
            cell.labelNomeEsercizio.text=workout.esercizi[indexPath.row].nome
            cell.labelDescrizione.text=workout.esercizi[indexPath.row].descrizione
            cell.imageEsercizio.image=UIImage(data: workout.esercizi[indexPath.row].foto)
            cell.imageEsercizio.layer.cornerRadius = 10.0
            cell.imageEsercizio.clipsToBounds = true
            
            return cell
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        deve caricare il video
        
        if segue.identifier == "allenamento"{
            let destinationController=segue.destination as! VideoWorkoutViewController
            destinationController.videoData=workout.video
            
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
