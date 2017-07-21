//
//  TRBaseRuleIntroViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/21.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit

class TRBaseRuleIntroViewController: UIViewController {
    var selectedIndex : Int = 0
    var sourceSegue : TRSegueIdentifier?
    override func viewDidLoad() {
        super.viewDidLoad()


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



extension TRBaseRuleIntroViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var initIdentifier:String?
        var image1 : UIImage?
        var image2 : UIImage?
        var subText : String?
        if self.sourceSegue == .ShowBaseRuleInfoSegue {
            switch selectedIndex {
            case 0:
                initIdentifier = "TRImageAndTextCell1"
                image1 = UIImage(named : "3-2-1")
                subText = "日本的道路行驶，以靠左车道为准。当行车车道为2线道时，右车道是留给 预定右转弯的车行驶与待机转弯的车道，因此若非预定右转弯，一般车均 行驶于2线道的左侧车道。另外，变换车道时，需事先打方向灯提醒后方来车。"
                break
            case 1:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-2-1")
                image2 = UIImage(named :"3-2-2-2")
                subText = "原则上在右转弯时，以逆向车道的车为优先。右转车需等待逆向直行车通 过后，再转弯通过。另外，左转弯时，日本以本身左转弯车为优先，并无 礼让逆车道右转(GIVE WAY)的规则。"
                break
            case 2:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-3-1")
                image2 = UIImage(named :"3-2-3-2")
                subText = "北海道并无允许红灯左转的车道或十字路口。红灯时，不管是直行车或左转车，均需停车，等待绿灯通行号志。"
                break
            case 3:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-4-1")
                image2 = UIImage(named :"3-2-4-2")
                subText = "原则上前方号志为红灯时，均需停车。但是若在号志灯有横向的箭头绿灯 显示时，表示仅准许车辆依箭头指示方向转弯行驶。最常见的是右转弯的 箭头绿灯。右转弯的箭头绿灯显示时，请注意逆向车道的来车，并迅速转 弯通过。此箭头绿灯号志的路口，通常会有右转车专用车道。"
                break
            case 4:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-5-1")
                image2 = UIImage(named :"3-2-5-2")
                subText = "北海道的道路又宽又直，周围的建筑物又少，所以比较无法感觉到愈开愈 快的车速。察觉时很可能是正踩着油门猛催时。速限在市街地为时速 30~50公里，郊外及干线道路是时速40~60公里。高速公路是时速 70~100公里，但强风或大雪时，可能降为时速50公里。因路长且距离 远，仍有无标示速限标志的道路，或者是高速公路上无电子速限显示器等 情形。此时，请您以法定速限为基准(一般道路时速60公里 高速公路时速 100公里)。经常注意速限，注意安全地开车旅行。"
                break
            case 5:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-6-1")
                image2 = UIImage(named :"3-2-6-2")
                subText = "在标示有禁止超车的道路上，绝对禁止超车。因为在禁止超车的车道，常 因视线不清，或前方有急转弯而被标示，在此区域超车非常地危险。通过 禁止超车路段之后，再行于安全的地方超车。"
                break
                
            case 6:
                initIdentifier = "TRImageAndTextCell3"
                let cell: TRImageAndTextCell = tableView.dequeueReusableCell(withIdentifier: initIdentifier!) as! TRImageAndTextCell
                return cell
                
            case 7:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-8-1")
                image2 = UIImage(named :"3-2-8-2")
                subText = "【时差式交通号志是什么!】\n基本上，行车车道的交通号志为红灯时，逆向车道的交通号志也是红灯。 但是因路段不同，为能疏散交通拥塞路段，其设定时间差，让较拥塞的车 道能有较长的绿灯时间。\n\n【人车分离式号志是什么!】\n为保护行人，在行人多的市中心街道上，设有行人与车辆不交会的人车分 离式号志。通常是车辆用号志为绿灯时，行人用号志皆为红灯。结束后， 车辆用号志皆为红灯时，此十字路口变为行人专用。此为行人与车辆不交 会，两者皆可更安全地通过十字路口的分离式号志。"
                break
            case 8:
                initIdentifier = "TRImageAndTextCell1"
                image1 = UIImage(named : "3-2-9")
                subText = "「酒后请勿驾驶」是世界共通的基本常识。日本同样严格取缔，并严惩酒后 驾车。驾驶人如被检测出呼气中带有酒精含量的话，以酒后开车(带酒气驾 车)违规，处以罚则(3年以下的刑罚或50万日圆以下的罚款)。更且被认定是 因受酒精影响而无法正常开车(酒醉开车)时，会处以更重的罚则。在日本拒 绝酒测仍会受到处罚。尚且，未喝酒的人搭乘喝酒驾驶者的车，或者是向驾 驶人劝酒的人，都是违法的，对周遭的人造成困扰。绝对禁止酒后驾车。"
                break
                
            case 9:
                initIdentifier = "TRImageAndTextCell2"
                image1 = UIImage(named :"3-2-10-1")
                image2 = UIImage(named :"3-2-10-2")
                subText = "交通号志的位置\n  日本的交通号志设于穿越十字路口的左前侧，交通号 志与停止位置较远，虽能立刻适应，但一开始时必须要 注意一下。\n\n还是不懂!! 此时请看\n●北海道环境生活部「交通安全的基础知识」(语言:日语・英语・繁体中文・韩文)\nhttp://www.pref.hokkaido.lg.jp/ks/dms/saftydrive/eng/index.htm  \n\n●一般社团法人札幌租车协会\n「安全驾驶启蒙录像」(语言:日语・英语)\nhttp://sapporo-renta.com/movie/"
                break
            default:
                break
                
            }
        } else {
            initIdentifier = "TRImageAndTextCell2"
            image1 = UIImage(named :"3-3-1-1")
            image2 = UIImage(named :"3-3-1-2")
            subText = "单行道，常见于热闹的商店街道路、或者是交通流量大 的道路。为了到达目的地，只能先穿越过「无法转弯的 道路」再回转。以札幌市内中心街道的单行道来说，为 南北方向交替配置。不仅是市中心的路道，若能在事前 知道道路的构造，对行车上更方便。"
        }
        
        let cell: TRImageAndTextCell = tableView.dequeueReusableCell(withIdentifier: initIdentifier!) as! TRImageAndTextCell
        cell.imageView1?.image = image1
        cell.imageView2?.image = image2
        cell.subTextLabel.text = subText
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedIndex {
        case 0:
            return 280
        case 1:
            return 550
            
        default:
            return 40
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: TRSegueIdentifier.ShowBaseRuleInfoSegue.rawValue, sender: self)
        
    }
}




