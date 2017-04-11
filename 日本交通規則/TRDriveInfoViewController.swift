//
//  TRDriveInfoViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/28.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRDriveInfoViewController: UIViewController {
    var selectedIndex:Int = 0
    
    let dataDic:[(cellTitle : String , subTitle : String)] = [("交会的十字路口为单行道， 无法转弯时。 此时怎么办...?" , "十字路口交会") , ("违规停车被取缔时，怎么办?" , "违规停车") , ("付费停车收费计的利用方式" , "付费停车") , ("高速公路的利用" , "高速公路的利用") , ("加油站的利用方法" , "加油站的利用方法") , ("冬天驾驶请谨慎小心" , "冬季驾驶") , ("冬天雪道驾驶小知识" , "雪道驾驶")];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let iden:String = segue.identifier , iden == TRSegueIdentifier.ShowDriveInfoCrossSegue.rawValue {
            segue.destination.title = dataDic[selectedIndex].subTitle
            let destVC : TRBaseRuleIntroViewController = segue.destination as! TRBaseRuleIntroViewController
            destVC.selectedIndex = selectedIndex
            destVC.sourceSegue = TRSegueIdentifier.ShowDriveInfoCrossSegue
        }else{
            
        }
        
    }

}
extension TRDriveInfoViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDic.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifier = "DriveInfoCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: initIdentifier)!
        cell.textLabel?.text = dataDic[indexPath.row].cellTitle
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        switch selectedIndex {
        case 0:
            self.performSegue(withIdentifier: TRSegueIdentifier.ShowDriveInfoCrossSegue.rawValue, sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: TRSegueIdentifier.ShowDriveInfoParkSegue.rawValue, sender: self)
            break
        default:
            break
        }
        
    }
}
