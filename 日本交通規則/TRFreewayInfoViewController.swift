//
//  TRFreewayInfoViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/04/14.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRFreewayInfoViewController: UIViewController {

    let headerViewHeight: CGFloat = 40.0
    let headerViewTitle: [String] = ["", "入口是哪里？", "进哪个入口才好？", "去哪里才好？", "【速限】", "【收费站】", "行车车道（靠左行驶）！"]
    let freewayBaseInfo: [String] = ["以绿色路牌确认高速公路的入口", "开进「一般」入口处取票", "循指示路牌开往自己的目的地", "记得目的地的出口名", "循绿色路牌下高速公路", "下高速公路后，在收费处缴费。"]
    
    let freewayInfo: [(title: String, icon: String)] = [("「新千岁机场IC」等等，IC（交流道）就是高速公速的入口。一般道路的路牌全部是「浅蓝色」，但是交流道处，全部是「绿色」。因此可循绿色路牌前进。", "3-3-4-2"), ("入口处分为一般、ETC专用、以及两者兼用。来自国外的旅客无法使用ETC卡，所以从绿色路牌的「一般」进入。", "3-3-4-3"), ("通过入口处后，出现指往2个方向的路牌，循指示路牌开往自己想去方向的车道前进。标志路牌为「都市名」，所以事先必须了解主要都市和终点IC的关系位置。万一，开错进入相反方向时，请冷静沉着，于下一个IC下高速公路后，再次重新进入即可。", "3-3-4-4"), ("高速公路的速限标志为可变式的电子速限显示标志，因气象状况及道路状况可改变行车速限。若无速限显示时，请以法定速限，高速公路时速100公里为准。开车时请经常留意速限标志。", "3-3-4-5"), ("高速公路从入口的出票机取票，交给出口的服务人员并支付必要费用的系统。支付费用的设定是按照距离长短计算。除现金之外，也接受以下的信用卡(不须签名)。\nJCB卡、NICOS卡、美国运通卡、大来卡、VISA卡、万事达卡", ""), ("行车车道为2线道的高速公路分为「行车车道」和「超车车道」。左侧为一般行车车道（靠左行驶）。右侧则为超车车道。日本在车道规则方面执行的相当彻底。所以，当超车之后，须慢慢地回到一般行车车道上。", "3-3-4-6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "高速公路的利用"
    }
}
extension TRFreewayInfoViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 + freewayBaseInfo.count
            
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerViewTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "freewayInfoImageCell") as! TRImageAndTextCell
                cell.imageView1.image = UIImage(named: "3-3-4-1")
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "freewayInfoTitleCell") as! TROverViewTableViewCell
                cell.indexLabel?.text = "\(indexPath.row)"
                cell.titleLabel.text = freewayBaseInfo[indexPath.row - 1]
                return cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "freewayInfoTitleImageCell") as! TROverViewTableViewCell
            cell.subTitleLabel.text = freewayInfo[indexPath.section - 1].title
            cell.imageButton.setImage(UIImage(named: freewayInfo[indexPath.section - 1].icon), for: UIControlState.normal)
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(valueRGB: 0xf7f7f7, alpha: 1)
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.textColor = UIColor(valueRGB: 0x509932, alpha: 1)
        textLabel.backgroundColor = UIColor(valueRGB: 0xf7f7f7, alpha: 1)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.text = headerViewTitle[section]
        bgView.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: headerViewHeight)
        textLabel.frame = CGRect(x: 10, y: 0, width: bgView.bounds.size.width - 20, height: headerViewHeight)
        bgView.addSubview(textLabel)
        return bgView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0 ? 0 : headerViewHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
