//
//  TableViewCell.swift
//  tabelview
//
//  Created by Anil on 7/16/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var lablcapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
