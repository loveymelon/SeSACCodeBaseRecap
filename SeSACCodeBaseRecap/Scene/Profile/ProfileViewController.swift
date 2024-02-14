//
//  ProfileViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/10/24.
//

import UIKit

enum UserInputError: Error {
    case emotion
    case number
    case moreLess
}

final class ProfileViewController: BaseViewController {

    let mainView = ProfileView()
    
    let emotion = ["@", "#", "$", "%"]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureNav() {
        super.configureNav()
        self.navigationItem.title = "프로필 설정"
    }
    
    override func delegateDataSource() {
        self.mainView.nicknameTextField.delegate = self
    }
    
    override func addAction() {
        let circleViewGesture = UITapGestureRecognizer(target: self, action: #selector(tappedGesture))
        print(#function)
        
        self.mainView.signUpButton.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
        
        self.mainView.circleView.profileImageView.addGestureRecognizer(circleViewGesture)
    }
    
    @objc func tappedSignupButton(sender: UIButton) {
        
    }
    
    @objc func tappedGesture(sender: UITapGestureRecognizer) {
        let vc = ProfileImageSettingViewController()
        vc.mainView.circleView.profileImageView.image = self.mainView.circleView.profileImageView.image
        
        vc.mainView.circleView.randomNum = self.mainView.circleView.randomNum
        
        vc.imageData = { result in
            self.mainView.circleView.profileImageView.image = UIImage(named: result)
        }
        
        self.transition(style: .push, viewController: vc, type: ProfileImageSettingViewController.self)
    }
    
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textCount = textField.text?.count else { return true }
        
        do {
            if textCount >= 2 && textCount < 10 {
                self.mainView.checkState = .success
            }
            try textFieldUserInput(text: string, count: textCount)
        } catch {
            switch error {
            case UserInputError.emotion:
                self.mainView.checkState = .emotion
                return false
            case UserInputError.number:
                self.mainView.checkState = .number
                return false
            case UserInputError.moreLess:
                self.mainView.checkState = .moreLess
            default:
                print("Unknow Error")
                return false
            }
        }
        
        return true
    }
    
}

extension ProfileViewController {
    func textFieldUserInput(text: String, count: Int) throws {
        guard !emotion.contains(text) else {
            throw UserInputError.emotion
        }
        
        guard Int(text) == nil else {
            throw UserInputError.number
        }
        
        guard count > 1 && count < 10 else {
            throw UserInputError.moreLess
        }
    }
}
