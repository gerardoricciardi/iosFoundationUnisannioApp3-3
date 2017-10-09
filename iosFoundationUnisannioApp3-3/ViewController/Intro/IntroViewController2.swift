//
//  IntroViewController2.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

//ViewController per scelta uomo/donna

class IntroViewController2: UIViewController {

    @IBOutlet weak var buttonDonna: UIButton!
    @IBOutlet weak var buttonUomo: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImage(named: "benvenuto")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        // Do any additional setup after loading the view.
    }
  
    @IBAction func maleAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let male = "Male"
        defaults.set(male, forKey: "Sex")
        defaults.synchronize()
    }
    @IBAction func femaleAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let female = "Female"
        defaults.set(female, forKey: "Sex")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
