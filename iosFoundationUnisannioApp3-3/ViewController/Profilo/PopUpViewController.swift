//
//  PopUpViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 06/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBAction func closePopUp(_ sender: UIButton) {
        //self.view.removeFromSuperview()
        self.removeAnimate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.showAnimated()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimated(){
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations:{
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX:1.0,y:1.0)
        });
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations:{
            self.view.transform = CGAffineTransform(scaleX:1.3,y:1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool ) in
            if(finished){
                self.view.removeFromSuperview()
            }
        });
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
