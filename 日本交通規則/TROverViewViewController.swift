//
//  TROverViewViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/15.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TROverViewViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex:Int = 0
    
    let dataDic:[(title : String , subTitle : String)] = [("左边行驶" , "日本的道路行驶，以靠左车道为准。") , ("右转车必须等待" , "原则上以直行车及左转车优先。\n右转车需等待逆向直行车通过后，再转弯通过。") , ("红灯必停" , "红灯时，不管是直行车或左转车，均需停车。") , ("遵守箭头绿灯的指示方向" , "遇上红灯，若有箭头绿灯时，表示仅准许车辆依箭头指示方向转弯行驶。") , ("注意行驶的速限，法定速限为时速60公里" , "无速限标志时，一般道路的速限为\n时速60公里．高速公路为时速100公里") , ("注意禁止超车" , "在标有禁止超车的道路上，绝对禁止超车。") , ("停车再开时需完全停止，遇上平交道时一定要停车再开" , "在日本需严格遵守减速暂时的动作。若不完全停止或缓行时，\n仍被视为违反交通规则。且在平交道前，一定要停车再开。") , ("切勿急踩油门前进，看清楚前方的号志" , "在拥挤车道的绿灯时间较长，以及在特定的十字路口设置\n有人车分离式的号志，分离人车动线，减少人车冲突。") , ("禁止酒后驾车" , "「酒后请勿驾驶」是绝对原则，搭乘喝酒驾驶者的车，\n或者是向驾驶人劝酒的人，都是违法的。") , ("有益的小信息" , "交通号志的位置")];
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor(valueRGB: 0x509932, alpha: 1.0))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        tableView.contentOffset = CGPoint(x: 0, y: 0)
//        navigationController?.navigationBar.lt_reset()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let iden:String = segue.identifier , iden == TRSegueIdentifier.ShowBaseRuleIntroSegue.rawValue {
            segue.destination.title = dataDic[selectedIndex].title
            let destVC : TRBaseRuleIntroViewController = segue.destination as! TRBaseRuleIntroViewController
            destVC.selectedIndex = selectedIndex
            destVC.sourceSegue = TRSegueIdentifier.ShowBaseRuleIntroSegue
        }else{
            
        }
        
    }
}

extension TROverViewViewController : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDic.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"
        let cell: TROverViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: initIdentifier) as! TROverViewTableViewCell
        cell.indexLabel.text = String(indexPath.row + 1)
        cell.titleLabel.text = dataDic[indexPath.row].title
        cell.subTitleLabel.text = dataDic[indexPath.row].subTitle
        return cell

    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: TRSegueIdentifier.ShowBaseRuleIntroSegue.rawValue, sender: self)
        
    }
}

//extension TROverViewViewController : UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        if offsetY > 0 {
//            if offsetY >= 44 {
//                setNavigationBarTransformProgress(progress: 1)
//            }else{
//                setNavigationBarTransformProgress(progress: offsetY / 44)
//            }
//        }else{
//            setNavigationBarTransformProgress(progress: 0)
//            navigationController?.navigationBar.backIndicatorImage = UIImage()
//        }
//    }
//    
//    func setNavigationBarTransformProgress(progress : CGFloat) {
//        navigationController?.navigationBar.lt_setTranslationY(translationY: -44 * progress)
//        navigationController?.navigationBar.lt_setElementsAlpha(alpha: 1 - progress)
//    }
//}







