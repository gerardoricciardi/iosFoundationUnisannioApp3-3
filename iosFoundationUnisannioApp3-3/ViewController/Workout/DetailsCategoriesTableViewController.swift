//
//  DetailsCategoriesTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 06/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class DetailsCategoriesTableViewController: UITableViewController {

    var workouts:[Workout]!
    
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
        return workouts.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetailsCategories", for: indexPath) as! DetailsCategoriesTableViewCell
        print(workouts.count)
        
        cell.anteprimaWO.image=UIImage(data:workouts[indexPath.row].anteprima!)
        cell.anteprimaWO.layer.cornerRadius = 30.0
        cell.anteprimaWO.clipsToBounds = true
        self.title = workouts[indexPath.row].categoria
        
        print(workouts[indexPath.row].categoria)
        if indexPath.row == 0 {
            cell.lockImage.image = UIImage(named: "unlock")
        }
        else{
            cell.lockImage.image = UIImage(named: "lock")
        }
        
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "videoPreview"{
        if let indexPath=tableView.indexPathForSelectedRow{
     let destinationController = segue.destination as! TableViewControllerPreviewAllenamento
            
            var id=workouts[indexPath.row].id
            var anteprima=workouts[indexPath.row].anteprima
        
            destinationController.workout=TestSaverRecord.getWorkoutDetailsById(id:id!)
        
//            destinationController.imageAnteprima.image=UIImage(data:anteprima!)
     
     }
     }
    }

}
