//
//  PlaceHolder+Extension.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/11/24.
//

import UIKit

extension UITextField {
    
    func setPlaceholder(string: String, color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
}
