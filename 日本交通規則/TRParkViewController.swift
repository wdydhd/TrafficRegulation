
//
//  TRParkViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/03/01.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRParkViewController: UIViewController {
    let headerViewHeight: CGFloat = 40.0
    let headerViewTitle: [String] = ["违规停车被取缔时，怎么办?", "违规停车被取缔时的处理", "违规停车被取缔后", "是否违规停车，自行判断!", "這個交通標誌…"]
    let parkViolationTreatment: [(titleText: String , detailText: String)] = [("连络警察" , "右图为违法停车取缔单中有记载连络方式，请尽速连络。"), ("缴纳交通违规罚款" , "前往警察局办理手续并领取缴纳单。在附近的金融机关缴纳罚款，并 领取缴纳收据。"), ("向租车公司报告" , "向租车公司提示已处理的手续文件及缴纳收据。 无法提示时将课处违约金。")]
    let parkMark: [(titleText: String , detailText: String)] = [("〔禁止停车与临时停车〕" , "此交通标志为「禁止停车或是临时停车」。有此交通标志的道路上禁止停车。上方的「8-20」表示适用时间为8:00～20:00，如果没有标示可用时间，就是完全禁止。"), ("〔禁止停车〕" , "此交通标志为「禁止停放车辆」。有此交通标志的道路上，仅供乘客下车及临时卸货之外，禁止停车。上方的「8-20」表示适用时间为8:00～20:00，如果没有标示可用时间，就是完全禁止。")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TRParkViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        case 1:
            return parkViolationTreatment.count
            
        case 2:
            return 1
            
        case 3:
            return 1
            
        case 4:
            return parkMark.count
            
        default:
            break
            
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerViewTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "subTitleCell")!
            cell.textLabel?.text = "日本对违规停车的取缔相当严格，即使是临时停车也一定要找「可停车的区 域」去停车。如果一般车违规停车被取缔时，须缴纳罚款(普通车违规得情 形)10,000〜18,000日圆。"
            return cell
            
        case 1:
            let cell: TROverViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "parkInfoCell") as! TROverViewTableViewCell
            cell.indexLabel?.text = String(indexPath.row + 1)
            cell.titleLabel.text = parkViolationTreatment[indexPath.row].titleText
            cell.subTitleLabel.text = parkViolationTreatment[indexPath.row].detailText
            if indexPath.row == 0 {
                cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                cell.imageButton.setImage(UIImage(named: "3-3-2-1"), for: UIControlState.normal)
            } else {
                cell.imageButtonHeigth.constant = 0
                cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
            }
            return cell
            
        case 2:
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "subTitleCell")!
            cell.textLabel?.text = "违规停车的取缔单贴付在车子上后，警察会从车子的牌照号码查出汽车所有者，也就是说，警察会将交通违规的事实告知租车公司。在还车前，一定要依循警察的指示办完手续再还车。"
            return cell
            
        case 3:
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "subTitleCell")!
            cell.textLabel?.text = "外国人违规停车的人非常多。根据租车公司的调查，被取缔的外国人违规停车比率，高达日本人的8倍。因此该地是否是禁止停车地方，一定要亲眼确认交通标识及标示。"
            return cell
            
        case 4:
            let cell: TROverViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "parkInfoNoIndexCell") as! TROverViewTableViewCell
            cell.titleLabel.text = parkMark[indexPath.row].titleText
            cell.subTitleLabel.text = parkMark[indexPath.row].detailText
            switch indexPath.row {
            case 0:
                cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                cell.imageButton.setImage(UIImage(named: "1 (20)"), for: UIControlState.normal)
            case 1:
                cell.imageButtonHeigth.constant = cell.bounds.size.height - 16
                cell.imageButton.setImage(UIImage(named: "1 (21)"), for: UIControlState.normal)
            default:
                cell.imageButtonHeigth.constant = 0
                cell.imageButton.setImage(UIImage(), for: UIControlState.normal)
            }
            if indexPath.row == 1 {
            }
            return cell
            
        default:
            break
            
        }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "subTitleCell")!
        return cell
        
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
