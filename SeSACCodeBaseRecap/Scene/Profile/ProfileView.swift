//
//  ProfileView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/10/24.
//

import UIKit
import SnapKit
import Then

final class ProfileView: BaseView {
    
    enum CheckText {
        case success
        case emotion
        case number
        case moreLess
        
        var text: String {
            switch self {
            case .success:
                return "사용할 수 있는 닉네임이에요"
            case .emotion:
                return "닉네임에 @, #, $, %는 포함할 수 없어요"
            case .number:
                return "닉네임에 숫자는 포함할 수 없어요"
            case .moreLess:
                return "2글자 이상 10글자 미만으로 설정해주세요"
            }
        }
        
    }
    
    private let checkLabel = UILabel().then {
        $0.text = CheckText.moreLess.text
        $0.textColor = Color.pointColor
    }
    private let lineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let nicknameTextField = UITextField().then {
        $0.backgroundColor = Color.backColor
        $0.setPlaceholder(string: "닉네임을 입력해주세요 :)", color: .systemGray2)
        $0.textColor = Color.stringColor
    }
    
    let signUpButton = PointButton(frame: .zero).then {
        $0.setTitle("완료", for: .normal)
        $0.isEnabled = false
    }
    
    let circleView: ProfileCircleView = ProfileCircleView(frame: .zero)
    let photoImageView = InitialImageView(image: .camera)
    
    var checkState: CheckText = .moreLess {
        didSet {
            self.checkLabel.text = checkState.text
            print(checkState)
            if checkState == .success {
                self.signUpButton.isEnabled = true
            } else {
                self.signUpButton.isEnabled = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.circleView.layer.cornerRadius = circleView.frame.width / 2
        self.photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
    }
    
    override func configureUI() {
        super.configureUI()
        configureImageView()
    }
    
    override func configureHierarchy() {
        self.addSubview(circleView)
        self.circleView.addSubview(photoImageView)
        self.addSubview(nicknameTextField)
        self.addSubview(lineView)
        self.addSubview(checkLabel)
        self.addSubview(signUpButton)
    }
    
    override func configureLayout() {
        self.circleView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(140)
            make.top.equalTo(self.snp.top).inset(130)
            make.height.equalTo(self.circleView.snp.width)
        }
        
        self.photoImageView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(self.circleView).inset(5)
            make.width.height.equalTo(self.circleView).multipliedBy(0.25)
        }
        
        self.nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(self.circleView.snp.bottom).offset(40)
            make.height.equalTo(30)
        }
        
        self.lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(self.nicknameTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        
        self.checkLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.top.equalTo(self.lineView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
        
        self.signUpButton.snp.makeConstraints { make in
            make.top.equalTo(self.checkLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
}

extension ProfileView {
    func configureImageView() {
        self.circleView.randomNum = Int.random(in: 1...14)
        self.circleView.profileImageView.image = UIImage(named: UserDefaults.standard.string(forKey: "image") ?? "profile\(self.circleView.randomNum)")
    }
    
}
