//
//  ProfileView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import UIKit
import SnapKit
import Then

// 이미지 뷰의 contentMode는 커스텀 이미지 뷰를 생성하고
// 이미지 뷰의 원과 뒤에 동그란 뷰의 크기는 닉네임 세팅, 프로필 이미지 세팅과 동일 하므로 따로 뺀다.
final class ProfileCircleView: UIView {
    
    var randomNum: Int = 0
    let profileImageView = InitialImageView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
    }
    
}

extension ProfileCircleView: ConfigureUIProtocol {
    
    func configureUI() {
        configureHierarchy()
        configureLayout()
        
        self.backgroundColor = Color.pointColor
        self.isUserInteractionEnabled = true
    }
    
    func configureHierarchy() {
        self.addSubview(profileImageView)
    }
    
    func configureLayout() {
        self.profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(self).multipliedBy(0.9)
            make.centerX.centerY.equalTo(self)
            
        }
    }
}
