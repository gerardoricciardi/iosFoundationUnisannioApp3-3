//
//  TableViewCellPreviewEsercizi.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 05/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class TableViewCellPreviewEsercizi: UITableViewCell {

    @IBOutlet weak var labelNomeEsercizio: UILabel!
    @IBOutlet weak var labelDescrizione: UILabel!
    @IBOutlet weak var imageEsercizio: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
