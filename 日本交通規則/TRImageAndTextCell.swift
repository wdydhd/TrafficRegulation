//
//  TRImageAndTextCell.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/23.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRImageAndTextCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var subTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
