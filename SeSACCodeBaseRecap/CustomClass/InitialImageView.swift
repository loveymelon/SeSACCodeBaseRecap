//
//  InitialImageView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/10/24.
//

import UIKit

class InitialImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        
        configureImageView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InitialImageView {
    func configureImageView() {
        self.contentMode = .scaleToFill
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
    }
}
