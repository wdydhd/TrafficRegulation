//
//  TRRoadSignDetaileViewController.swift
//  日本交通規則
//
//  Created by yanqi on 2017/07/20.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRRoadSignDetaileViewController: UIViewController {
    
    @IBOutlet weak var roadSignImageView: UIImageView!
    @IBOutlet weak var roadSignLabel: UILabel!
    
    var selectedSignInfo: (signName: String , signImageName: String) = ("", "")
    override func viewDidLoad() {
        super.viewDidLoad()
        roadSignLabel.text = selectedSignInfo.signName
        roadSignImageView.image = UIImage(named: selectedSignInfo.signImageName)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}
