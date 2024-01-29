//
//  PointButton.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import UIKit
import SnapKit

class PointButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PointButton {
    func configureView() {
        self.backgroundColor = Color.pointColor.setColor
        self.layer.cornerRadius = 10
        self.setTitleColor(Color.stringColor.setColor, for: .normal)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
    }
}
