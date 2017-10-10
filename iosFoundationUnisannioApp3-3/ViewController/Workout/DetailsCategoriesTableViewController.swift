//
//  DetailsCategoriesTableViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 06/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class DetailsCategoriesTableViewController: UITableViewController {

    var workouts:[Workout] = []
    var categoria:String = ""
    var colorRow = UIColor(red: 55.0/255.0, green: 153.0/255.0, blue: 178.0/255.0, alpha: 1.0)
    var titleWorkouts = ["Workout 1", "Workout 2", "Workout 3"]
    var workout1 = ["1", "2", "3"]
    
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
        activityIndicator.color = UIColor(red: 55.0/255.0, green: 153.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        activityIndicator.startAnimating()
        self.tableView.tableFooterView = nil
        self.tableView.separatorStyle = .none
        self.tableView.isUserInteractionEnabled = false
        
          let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        concurrentQueue.async {
            self.workouts = TestSaverRecord.getWorkoutsByCategory(categoria: self.categoria)
        }
        concurrentQueue.async(flags: .barrier){
            activityIndicator.stopAnimating()
            self.tableView.isUserInteractionEnabled = true
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if workouts.isEmpty{
//            return 0
//        }
//        else{
//            return workouts.count
//        }
        return workout1.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetailsCategories", for: indexPath) as! DetailsCategoriesTableViewCell
        print(workouts.count)
        if indexPath.row != 0 {
            cell.isUserInteractionEnabled = false
            cell.backgroundColor = UIColor.white
            
        }
        else{
            cell.backgroundColor = UIColor.white
            cell.backgroundColor?.withAlphaComponent(0.7)
        }
        
//        cell.anteprimaWO.image=UIImage(data:workouts[indexPath.row].anteprima!)
        let imageName = categoria + workout1[indexPath.row]
        cell.anteprimaWO.image = UIImage(named: imageName)
        cell.anteprimaWO.layer.cornerRadius = 30.0
        cell.anteprimaWO.clipsToBounds = true
//        self.title = workouts[indexPath.row].categoria
        cell.titleEse.text = titleWorkouts[indexPath.row]
        
//        print(workouts[indexPath.row].categoria)
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
            
            destinationController.id=id
//            destinationController.imageAnteprima.image=UIImage(data:anteprima!)
     
     }
     }
    }

}
