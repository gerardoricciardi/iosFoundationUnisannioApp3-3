//
//  DetailsCategoriesTableViewCell.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Pagliaro Antonio on 06/10/2017.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class DetailsCategoriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleEse: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    
    @IBOutlet weak var viewIm: UIView!
    @IBOutlet weak var anteprimaWO: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
