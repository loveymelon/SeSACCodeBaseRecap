//
//  ProfileView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .profile1
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileView: ConfigureUIProtocol {
    func configureHierarchy() {
        self.addSubview(profileImageView)
    }
    
    func configureLayoutImageView() {
        self.profileImageView.snp.makeConstraints { make in
            make.horizontalEdges.verticalEdges.equalTo(self).multipliedBy(0.7)
        }
    }
    
    func configureUI() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width / 2
        }
        
        self.backgroundColor = Color.pointColor.setColor
    }
}
