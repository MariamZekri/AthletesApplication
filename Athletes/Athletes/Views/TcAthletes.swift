//
//  TcAthletes.swift
//  Athletes
//
//  Created by mariam abdelhamid on 10/19/17.
//  Copyright © 2017 Mariam Abdelhamid. All rights reserved.
//

import UIKit

class TcAthletes: UITableViewCell {
    
    @IBOutlet weak var athletesImg: UIImageView!
    @IBOutlet weak var athletesName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
