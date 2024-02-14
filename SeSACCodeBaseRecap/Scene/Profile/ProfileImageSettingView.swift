//
//  ProfileImageView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/11/24.
//

import UIKit
import SnapKit
import Then

final class ProfileImageSettingView: BaseView {
    let circleView: ProfileCircleView = ProfileCircleView()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout()).then {
        $0.allowsMultipleSelection = false
        $0.backgroundColor = Color.backColor
        $0.register(ImageSettingCollectionViewCell.self, forCellWithReuseIdentifier: ImageSettingCollectionViewCell.identifier)
    }
    
    var imageString: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.circleView.layer.cornerRadius = self.circleView.frame.width / 2
    }
    
    override func configureHierarchy() {
        self.addSubview(circleView)
        self.addSubview(collectionView)
    }
    
    override func configureLayout() {
        self.circleView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(130)
            make.height.equalTo(self.circleView.snp.width)
            make.top.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.circleView.snp.bottom)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}

extension ProfileImageSettingView {
    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 5)
        
        layout.itemSize = CGSize(width: width / 4, height: width / 4)
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 30, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .vertical
        
        return layout
    }
}

