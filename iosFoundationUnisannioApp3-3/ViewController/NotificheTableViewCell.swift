//
//  NotificheTableViewCell.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Zabatta Daniela on 05/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class NotificheTableViewCell: UITableViewCell {

    @IBOutlet weak var descrizioneText: UITextView!
    @IBOutlet weak var notificheLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*descrizioneNotifiche.text = "Se l'opzione in ufficio è abilitata, riceverai delle notifiche che ti consentiranno di fare un viaggio nel fitness sul posto di lavoro, attraverso alcuni esercizi da fare comodamente alla scrivania."*/
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
