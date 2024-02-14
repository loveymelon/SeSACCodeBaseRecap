//
//  BaseCollectionViewCell.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/12/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ConfigureUIProtocol {
    
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
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
}

