//
//  PhotoTableViewCell.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet var photoImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
