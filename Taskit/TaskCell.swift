//
//  TaskCell.swift
//  Taskit
//
//  Created by Roy Montoya on 3/9/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
   
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
   
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
