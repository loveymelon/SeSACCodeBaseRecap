//
//  BaseView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/13/24.
//

import UIKit

class BaseView: UIView, ConfigureUIProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureHierarchy()
        configureLayout()
        
        self.backgroundColor = Color.backColor
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
}
