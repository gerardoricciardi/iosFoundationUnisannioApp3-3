//
//  IntroViewControllerBenvenuto.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class IntroViewControllerBenvenuto: UIViewController {

    @IBOutlet weak var labelWelcome: UILabel!
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
        let defaults = UserDefaults.standard
        let name = defaults.string(forKey: "name")
//        let surname = defaults.string(forKey: "surname")
//        labelWelcome.lineBreakMode = NSLineBreakMode.byWordWrapping
//        labelWelcome.numberOfLines = 2
        labelWelcome.text = "Hello, " + name!

        // Do any additional setup after loading the view.
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
