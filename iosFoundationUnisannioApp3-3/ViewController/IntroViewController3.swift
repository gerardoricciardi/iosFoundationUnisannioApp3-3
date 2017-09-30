//
//  IntroViewController3.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

//ViewController per inserire orari di lavoro

class IntroViewController3: UIViewController {
    

    @IBOutlet weak var orarioFine: UIDatePicker!
    @IBOutlet weak var orarioInizio: UIDatePicker!
    
    
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
        
        orarioInizio.minuteInterval = Int(10)
        orarioFine.minuteInterval = Int(10)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        
        let dateIn = dateFormatter.date(from: "9:00")
        let dateOut = dateFormatter.date(from: "17:00")
        
        orarioInizio.date = dateIn!
        orarioFine.date = dateOut!
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(orarioInizio.date, forKey: "oraInizio")
        defaults.set(orarioFine.date, forKey: "oraFine")
/*
     Da un DATE ottengo ore e minuti
         
        let calendar = NSCalendar.current
        let oraInComponents = calendar.dateComponents([.hour, .minute], from: orarioInizio.date)
        let oraOutComponents = calendar.dateComponents([.hour, .minute], from: orarioFine.date)
        
        print(oraInComponents.hour)
        print(oraInComponents.minute)
        print(oraOutComponents.hour)
        print(oraOutComponents.minute)
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return orario[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return orario.count
    }
    
    //funzione per ricevere l'elemento scelto dall utente
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(orario[row])
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
