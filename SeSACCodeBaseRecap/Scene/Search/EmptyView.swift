//
//  EmptyView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/13/24.
//

import SnapKit
import Then
import UIKit

class EmptyView: BaseView {
    let imageView = InitialImageView(image: .empty)
    let emptyLabel = UILabel().then {
        $0.text = "최근 검색어가 없어요"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = Color.stringColor
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.addSubview(imageView)
        self.addSubview(emptyLabel)
    }
    
    override func configureLayout() {
        self.imageView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(self.imageView.snp.width).multipliedBy(0.7)
            make.top.equalTo(self.safeAreaLayoutGuide).inset(150)
        }
        
        self.emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(22)
        }
    }
    
}

