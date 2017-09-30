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
    let defaults=UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImage(named: "2")
        
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
    @IBAction func actionUomo(_ sender: Any) {
        
        
        defaults.set("uomo", forKey: "Sesso")
        defaults.synchronize()
/*
        //        stampa tutte le coppie
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
*/
        
    }
    
    @IBAction func actionDonna(_ sender: Any) {
        defaults.set("donna", forKey: "Sesso")
        defaults.synchronize()
 /*
//        stampa tutte le coppie
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
*/

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
