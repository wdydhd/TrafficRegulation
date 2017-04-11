//
//  TROverViewTableViewCell.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/16.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit
class TROverViewTableViewCell: UITableViewCell {
    @IBOutlet weak var indexLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var imageButtonHeigth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.indexLabel?.layer.cornerRadius = 12
        self.indexLabel?.layer.masksToBounds = true
        
        self.selectedBackgroundView = UIView(frame: self.frame)
        self.selectedBackgroundView?.backgroundColor = UIColor(valueRGB: 0x509932, alpha: 0.2)
        self.imageButton?.imageView?.contentMode = .scaleAspectFit
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let bgColor = self.indexLabel?.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        self.indexLabel?.backgroundColor = bgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let bgColor = self.indexLabel?.backgroundColor
        super.setSelected(selected, animated: animated)
        self.indexLabel?.backgroundColor = bgColor
    }

}
