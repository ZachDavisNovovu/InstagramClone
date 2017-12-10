//
//  postTableViewCell.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/8/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import UIKit

class postTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
