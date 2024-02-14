//
//  OnboardingViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import UIKit
import SnapKit
import Then

final class OnboardingViewController: BaseViewController {

    private let mainView = OnboardingView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func addAction() {
        self.mainView.startButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton(sender: UIButton) {
        self.transition(style: .push, viewController: ProfileViewController(), type: ProfileViewController.self)
    }

}
