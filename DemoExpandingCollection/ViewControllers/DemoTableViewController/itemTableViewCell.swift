//
//  itemTableViewCell.swift
//  Parcerias Barclays Moçambique
//
//  Created by Isidoro Pedro Da Silva Junior on 5/8/19.
//  Copyright © 2019 Alex K. All rights reserved.
//

import UIKit

class itemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Rating: UILabel!    

}

