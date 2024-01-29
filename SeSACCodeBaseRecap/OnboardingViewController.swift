//
//  OnboardingViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .onboarding
        return imageView
    }()
    
    let mainLabelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .sesacShopping
        return imageView
    }()
    
    let startButton: PointButton = {
        let button = PointButton()
        button.setTitle("시작하기", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

}

extension OnboardingViewController: ConfigureUIProtocol {
    
    func configureUI() {
        configureHierarchy()
        configureLayoutImageView()
        configureLayoutButton()
        
        self.view.backgroundColor = Color.backColor.setColor
    }
    
    func configureHierarchy() {
        self.view.addSubview(mainImageView)
        self.view.addSubview(mainLabelImageView)
        self.view.addSubview(startButton)
    }
    
    func configureLayoutImageView() {
        self.mainImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(self.mainImageView.snp.width).multipliedBy(1.15)
        }
        
        self.mainLabelImageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainImageView.snp.top).offset(-50)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(60)
            make.height.equalTo(self.mainLabelImageView.snp.width).multipliedBy(0.35)
        }
    }
}

extension OnboardingViewController {
    func configureLayoutButton() {
        self.startButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            
        }
    }
}
