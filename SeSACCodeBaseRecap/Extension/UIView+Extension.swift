//
//  UIView+Extension.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/12/24.
//

import UIKit

extension UIView: ReusableIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    } // NSObject description은 디버깅에 쓰인다고 나와서 아직 필요성을 못 느껴 사용하지 않았습니다.
}
