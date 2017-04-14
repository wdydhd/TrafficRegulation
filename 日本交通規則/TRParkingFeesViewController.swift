
//
//  TRParkingFeesViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/04/12.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRParkingFeesViewController: UIViewController {
    let headerViewHeight: CGFloat = 40.0
    let headerViewTitle: [String] = ["付费停车场的利用", "民间停车场和公共停车场", "公营地下停车场", "立体停车场・立体停车塔", "无人投币式停车场", "其它"]
    let parkingFeesFlowTitle: [(title: String, icon: String?)] = [("将车子停放至规定位置。", nil), ("向停车收费定时器投入硬币后取票。", "3-3-3-2"), ("停车证出票。", "3-3-3-3"), ("停车证贴于车内的挡风玻璃，让外面能清楚看见。", "3-3-3-4"), ("请确认可停车时间，超过60分钟的话属于违法停车，请注意。", "")]
    let parkInfo = [[("在札幌市中心有3个大型地下停车场。停车位多又宽广，可放心地去停车。但是必须住记自己停放的位置（圆柱号码等），以免找不到自己的车，再请注意。", nil), ("札幌车站北口地下停车场\n08:00～22:0030分钟170日圆", "3-3-3-5"), ("北一条地下停车场\n07:30～22:0030分钟190日元", "3-3-3-6"), ("札幌大通地下停车场\n08:00～22:001小时380日元", "3-3-3-7")], [("建筑物密集的街道市中心，并无平面式宽广的停车场。大部分的停车场都是立体停车场或停车塔的型态。", nil), ("立体停车场入口处取票，再前进依循螺旋式车道往上开，并停于空的停车格中。要离开时，亦自行开往出口收费机前，插入票并缴费。", "3-3-3-8"), ("立体停车塔由服务人员指示，将车子开进如电梯的升降机中，并向服务人员取票。要离开时，将票交给服务人员，等待升降机达1楼后，再行取车。", "3-3-3-9")],[("在道路两旁也有可停车的无人简便投币式停车场。车停妥后，车轮挡会自动升起，让汽车无法开。要离开时，请到收费机前结算金额，按下停车位号码及投入停车费后，车轮挡会自动下降。", "3-3-3-10")], [("当然，有些停车场的入口处会有收费站的小屋，服务人员会坐在里面，在此寄存车钥匙，也有传统式的停车场等等。若想要询问各样的信息时，在这种停车场停看看也很好。", "3-3-3-11")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension TRParkingFeesViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 + parkingFeesFlowTitle.count
            
        case 1:
            return 1
        default:
            return parkInfo[section - 2].count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerViewTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: TROverViewTableViewCell
            switch indexPath.row {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "parkInfoNoIndexCell") as! TROverViewTableViewCell
                cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                cell.imageButton.setImage(UIImage(named: "3-3-3-1"), for: UIControlState.normal)
                cell.subTitleLabel.text = "临时性地停车，最好利用付费停车场。因为就在路旁，地点好辨认且停车容易。右图的交通标志为收费临时停车位，在此标志的附近有可供停车的白线停车格。事先支付费用可以停车60分以内，超过60分的话即为停车违章。"
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: "parkInfoCell") as! TROverViewTableViewCell
                cell.titleLabel.text = parkingFeesFlowTitle[indexPath.row - 1].title
                cell.indexLabel?.text = "\(indexPath.row)"
                if let iconStr = parkingFeesFlowTitle[indexPath.row - 1].icon {
                    cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                    cell.imageButton.setImage(UIImage(named: iconStr), for: UIControlState.normal)
                } else {
                    cell.imageButtonHeigth.constant = 0
                    cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
                }
            }
            return cell
            
        case 1:
            let cell: TROverViewTableViewCell
            switch indexPath.row {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "parkInfoNoIndexCell") as! TROverViewTableViewCell
                cell.imageButtonHeigth.constant = 0
                cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
                cell.subTitleLabel.text = "在札幌市中心有3个大型地下停车场。停车位多又宽广，可放心地去停车。但是必须住记自己停放的位置（圆柱号码等），以免找不到自己的车，再请注意。"
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: "parkInfoCell") as! TROverViewTableViewCell
                cell.titleLabel.text = parkingFeesFlowTitle[indexPath.row - 1].title
                cell.indexLabel?.text = "\(indexPath.row)"
                if let iconStr = parkingFeesFlowTitle[indexPath.row - 1].icon {
                    cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                    cell.imageButton.setImage(UIImage(named: iconStr), for: UIControlState.normal)
                } else {
                    cell.imageButtonHeigth.constant = 0
                    cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
                }
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "parkInfoNoIndexCell") as! TROverViewTableViewCell
            cell.subTitleLabel.text = parkInfo[indexPath.section - 2][indexPath.row].0
            if let iconStr = parkInfo[indexPath.section - 2][indexPath.row].1 {
                cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                cell.imageButton.setImage(UIImage(named: iconStr), for: UIControlState.normal)
            } else {
                cell.imageButtonHeigth.constant = 0
                cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
            }
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
        return headerViewHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
