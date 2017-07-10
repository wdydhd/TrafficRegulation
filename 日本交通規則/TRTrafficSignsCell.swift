//
//  TRImageAndTextCell.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/23.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit
import SVGKit

class TRTrafficSignsCell: UICollectionViewCell {
    @IBOutlet weak var trafficSignIcon: UIImageView!
    
    @IBOutlet weak var signTitleLabel: UILabel!
    
    override func awakeFromNib() {
        
 
    }
    
    func setSvgImage(image: SVGKImage?) {
        guard let image = image else {
            return
        }
//        trafficSignIcon.tileRatio = CGSize(width: image.size.width, height: image.size.height)
//        trafficSignIcon.image = image
        trafficSignIcon.image = image.uiImage
    }
}
