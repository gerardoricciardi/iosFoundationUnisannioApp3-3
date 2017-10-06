//
//  ModificaProfiloTableViewCell.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Fabio dell'Infante on 04/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ModificaProfiloTableViewCell: UITableViewCell {
    let defaults=UserDefaults.standard
    
    @IBOutlet weak var OraInizio: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var OraFine: UIDatePicker!
    
    
    @IBAction func funcM(_ sender: UIButton) {
        
        defaults.set("uomo", forKey: "Sesso")
        defaults.synchronize()
        
    }
    
    @IBAction func funcF(_ sender: UIButton) {
        defaults.set("donna", forKey: "Sesso")
        defaults.synchronize()
    }
    @IBOutlet weak var Femm: UIButton!
    @IBOutlet weak var Masc: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
