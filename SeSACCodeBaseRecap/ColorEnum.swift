//
//  ColorEnum.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import Foundation
import UIKit

enum Color {
    case pointColor
    case backColor
    case stringColor
    
    var setColor: UIColor {
        switch self {
        case .backColor:
            return UIColor(named: "BackColor")!
        case .pointColor:
            return UIColor(named: "PointColor")!
        case .stringColor:
            return UIColor(named: "StringColor")!
        }
    }
}
