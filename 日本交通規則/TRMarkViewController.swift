//
//  TRMarkViewController.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/15.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import UIKit
import SVGKit
import Firebase
import GoogleMobileAds

class TRMarkViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let roadSignsDic = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "MarkDic", ofType: "strings")!)!
    var sectionTitleDic:[String] = []
    let rowNumbers: CGFloat = 3
    let rowItemSpace: CGFloat = 1.5
    static let headerViewHeight: CGFloat = 30
    static let footerViewHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionTitleDic = roadSignsDic.allKeys.sorted { (s1, s2) -> Bool in
            let str1: String = s1 as! String
            let str2: String = s2 as! String
            let subStr1 = str1.substring(with: Range<String.Index>(uncheckedBounds: (lower: str1.range(of: "(")!.lowerBound, upper: str1.range(of: ")")!.upperBound)))
            
            let subStr2 = str2.substring(with: Range<String.Index>(uncheckedBounds: (lower: str2.range(of: "(")!.lowerBound, upper: str2.range(of: ")")!.upperBound)))
            return subStr1.caseInsensitiveCompare(subStr2) == ComparisonResult.orderedAscending
        } as! [String]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if let sectionDic: NSDictionary = roadSignsDic.object(forKey: sectionTitleDic[section]) as? NSDictionary {
            return sectionDic.count
        }
        
        return 0;
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return roadSignsDic.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        let identify: String = "TRTrafficSignsCell"
        let cell = (self.collectionView?.dequeueReusableCell(
            withReuseIdentifier: identify, for: indexPath))! as! TRTrafficSignsCell
        
        guard let sectionDic: NSDictionary = roadSignsDic.object(forKey: sectionTitleDic[indexPath.section]) as? NSDictionary , let signInfo = sectionDic.object(forKey: sectionDic.allKeys[indexPath.row]) else {
            return cell
        }
//        let signImage = SVGKImage(named: sectionDic.allKeys[indexPath.row] as! String)
//        cell.setSvgImage(image: signImage)
        let imageName: String = sectionDic.allKeys[indexPath.row] as! String
        cell.trafficSignIcon.image = UIImage(named: imageName)
        cell.signTitleLabel.text = signInfo as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: TRMarkViewController.headerViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: TRMarkViewController.footerViewHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView: TRTrafficSignsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrafficSignsHeaderView", for: indexPath) as! TRTrafficSignsHeaderView
            headerView.sectionTitleLabel.text = sectionTitleDic[indexPath.section]
            return headerView
        } else if kind == UICollectionElementKindSectionFooter {
            let bannerView = GADBannerView(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: TRMarkViewController.footerViewHeight))
            bannerView.adUnitID = "ca-app-pub-2960563678064187/5465560557"
            bannerView.rootViewController = self
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID]
            bannerView.load(request)
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrafficSignsFooterView", for: indexPath)
            footerView.addSubview(bannerView)
            return footerView
        }
        return UICollectionReusableView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        FIRCrashMessage("Cause Crash button clicked_YQ")
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return rowItemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return rowItemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - (rowNumbers * rowItemSpace)) / rowNumbers, height: (UIScreen.main.bounds.size.width - (rowNumbers * rowItemSpace)) / rowNumbers)
    }
    
}
