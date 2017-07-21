//
//  TRConst.swift
//  日本交通規則
//
//  Created by YanQi on 2017/02/21.
//  Copyright © 2017年 YanQi. All rights reserved.
//

import Foundation


enum TRSegueIdentifier: String {
    case ShowBaseRuleInfoSegue = "ShowBaseRuleInfoSegue"
    case ShowDriveInfoCrossSegue = "ShowDriveInfoCrossSegue"
    case ShowDriveInfoParkSegue = "ShowDriveInfoParkSegue"
    case ShowDriveInfoParkingFeesSegue = "ShowDriveInfoParkingFeesSegue"
    case ShowFreewayInfoSegue = "ShowFreewayInfoSegue"
    case ShowGasStationSegue = "ShowGasStationSegue"
    case ShowRoadSignDetaileSegue = "ShowRoadSignDetaileSegue"
}



enum ASCIIControlCharacter: String {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
