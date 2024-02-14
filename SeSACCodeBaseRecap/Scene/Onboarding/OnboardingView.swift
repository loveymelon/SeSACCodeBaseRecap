//
//  OnboardingView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/10/24.
//

import UIKit
import SnapKit

final class OnboardingView: BaseView {
    private let mainImageView = InitialImageView(image: .onboarding)
    
    private let mainLabelImageView = InitialImageView(image: .sesacShopping)

    let startButton = PointButton().then {
        $0.setTitle("시작하기", for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.addSubview(mainImageView)
        self.addSubview(mainLabelImageView)
        self.addSubview(startButton)
    }
    
    override func configureLayout() {
        self.mainImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(self.mainImageView.snp.width).multipliedBy(1.15)
        }
        
        self.mainLabelImageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainImageView.snp.top).offset(-50)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(60)
            make.height.equalTo(self.mainLabelImageView.snp.width).multipliedBy(0.35)
        }
        
        self.startButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
}
