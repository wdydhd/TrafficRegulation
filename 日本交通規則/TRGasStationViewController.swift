//
//  TRGasStationViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/04/17.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRGasStationViewController: UIViewController {
    let headerViewHeight: CGFloat = 40.0
    let headerViewTitle: [String] = ["", "加油站在哪里?", "加油站分成2大种类。", "燃油有3种类。汽油有2种种类。", "去自助式加油站自已加油看看"]
    let gasStationTitle: [(title: String, icon: String?)] = [("在日本的「加油站」，以外来语标示「gasoline station」（发音为GA-SO-RI-N SU-TA-N-DO ）。「油种搞混」而加错油时，严重时容易发生车辆故障。敬请确实记得其发音。\n※简码 加油站＝GS 和服务加油站＝SS", nil), ("都市周边或交通量较多的干线道路可以轻易找到。但是离开都市或在交通 量很少的道路，就变得非常地少。GS较多的地方为都市周边，卡车等等大 型车辆来往市区的2线车道以上的道路旁。营业时间在市区也有24小时营 业的地方，但是交通量很少的地方也有夜间6点以后，或周末休息的加油 站，请您注意。请勿让残油过少状况出现，尽早加油。特别是远离都市区 域时要注意。", "3-4-1-1"), ("有店员驻守的加油站，让店员帮您加油的「服务型」，以及无人服务的「自助式」加油站两种。使用自助式加油站，油 品的价格较便宜。有店员服务型的加油站，须将「油种」与「量或金额」告知，若想加满油「Full Tank」时，请说「满 单(MA-N-TA-N)」即可。之后店员会帮您加油擦车窗等殷勤地服务。偶尔也会有送地图和卫生纸的服务。", "3-4-1-2"), ("燃油分「98无铅」「92无铅」「柴油」等3种类。在日本所租的车子，大部分加的是「92无铅」(regular)的汽油。几 乎没有柴油机引擎的承租车，所以请千万不要加柴油。若误将「汽油」与「柴油」搞混而加错油时，车会故障无法 开。日本的汽油大致几乎都是无铅汽油。", "3-4-1-3"), ("以下是一般的自助式加油站的加油流程例。※因为每个加油站的加油系统不同，在此以完整的 一例做介绍。其他也有加油后再到收银柜台，向店员缴纳的后付款方式。", nil)]
    let fuelupInfo: [(title: String, subTitle: String, icon: String)] = [("", "", ""), ("将车子停妥于汽油泵岛的油泵旁", "依汽车油箱孔的位置，将车子停妥于油泵侧。油箱孔位置请事先确认好。停好车后熄火关引擎", "3-4-1-5"), ("预付费用", "加油费的支付方式，以预付「现金」或「信用卡」都能支付。\n(1)现金......现金放入插入口 例如，想加油30升时约需放入5,000-6,000日圆的纸钞。加油后，以时价 × 加油量(公升)计算总加油费用，金额扣除后的零钱会从归还口退还。\n(2)信用卡......插入卡片读卡认证 插入读卡机「插入，立刻拔出」，或者是「从上至下」的刷卡方式，进行读 卡认证。", "3-4-1-6"), ("选择油种和油量", "从油泵上的触碰式萤幕上「98无铅」「92无铅」「柴油(轻油)」之中选择您 要加的油种。租车公司的车子几乎都是加「92无铅」，请按标示的按钮。油量 的指定有2个方式，以加油量「10公升」「20公升」「30公升」...「50公升」 中选择，或者是以加油费「1,000日圆」「2,000日圆」「3,000日圆」... 「5,000日圆」中选择。当然想加满油「Full Tank」时，请按标示 「满(MA-N-TA-N)」即可。", "3-4-1-7"), ("加油中", "打开车子的油箱盖，将油泵上的油枪拿起，对准油箱孔后插入。普通油枪有3 种类(颜色)，请选取正确的加油枪。油种一定在标示在油枪上，且颜色也不 同。按油枪握柄后开始加油。指定的油量注入之后会自动停止加油(油枪自动 跳停)。", "3-4-1-8"), ("加油后", "放回油枪至原来的位置，旋紧油箱盖。确认油泵上表示的已加汽油量和金额。 若用现金有找零的话，不要忘记取回退回的零钱。现金或信用卡均会有自动列 印收据。", "3-4-1-9"), ("注意", "加油时严禁烟火是基本常识！引燃汽油会造成无法想象的后果。并且静电气也是非常的危险，一定别忘记，要在加油前除去静电 危险的汽油! (仅仅触碰一下消静电钮而已)。加油时手机也不可使用。", "3-4-1-10")]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "加油站的利用方法"
    }
    
}
extension TRGasStationViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return 3
        case 4:
            return 7
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerViewTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 3:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "gasInfoNoIndexCell") as! TROverViewTableViewCell
                let info = gasStationTitle[indexPath.section]
                if let imageName = info.icon {
                    cell.imageButton.setImage(UIImage(named: imageName), for: UIControlState.normal)
                } else {
                    cell.imageButtonHeigth.constant = 0
                }
                cell.subTitleLabel.text = info.title
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "gasInfoNoIndexCell") as! TROverViewTableViewCell
                cell.imageButtonHeigth.constant = 0
                cell.subTitleLabel.text = "●燃油(汽油)的种类\n〔在自助式加油站中加油时，请注意并看仔细，不要加错油!〕 一般的「92无铅(regular)」的辛烷值约90左右。「98无铅(high-octane)」是高辛烷值约在98-100左右。「98无铅 (high-octane)」依加油站不同，为节省燃料费且可防止引擎恶化，适合高性能之车辆使用，并有各自均有其独特的名 称，如「PREMIUM」「SUPER」「F1」「VIGO」「SUPER MAGNUM」「SHELL PURA」等等。"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "gasImageCell")
                return cell!
            }
        case 4:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "gasInfoNoIndexCell") as! TROverViewTableViewCell
                let info = gasStationTitle[indexPath.section]
                if let imageName = info.icon {
                    cell.imageButton.setImage(UIImage(named: imageName), for: UIControlState.normal)
                } else {
                    cell.imageButtonHeigth.constant = 0
                }
                cell.subTitleLabel.text = info.title
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "gasInfoCell") as! TROverViewTableViewCell
                cell.indexLabel?.text = "\(indexPath.row)"
                cell.titleLabel.text = fuelupInfo[indexPath.row].title
                cell.subTitleLabel.text = fuelupInfo[indexPath.row].subTitle
                cell.imageButton.setImage(UIImage(named: fuelupInfo[indexPath.row].icon), for: UIControlState.normal)
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "gasInfoNoIndexCell") as! TROverViewTableViewCell
            let info = gasStationTitle[indexPath.section]
            if let imageName = info.icon {
                cell.imageButton.setImage(UIImage(named: imageName), for: UIControlState.normal)
            } else {
                cell.imageButtonHeigth.constant = 0
            }
            cell.subTitleLabel.text = info.title
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
        if section == 0 {
            return nil
        }
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
        return section == 0 ? 0 : headerViewHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

