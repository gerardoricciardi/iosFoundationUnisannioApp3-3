//
//  CategoriesDetailsViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class CategoriesDetailsViewController: UIViewController {

    @IBOutlet weak var categoryImage: UIImageView!
    
    var thumb = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryImage.image = UIImage(named: thumb)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videoPreview"{
            
                let destinationController = segue.destination as! TableViewControllerPreviewAllenamento
                
//                destinationController.thumb = categoriesImage[indexPath.row]
            
            
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
