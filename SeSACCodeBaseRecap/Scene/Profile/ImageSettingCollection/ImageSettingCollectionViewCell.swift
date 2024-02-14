//
//  ImageSettingCollectionViewCell.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/12/24.
//

import UIKit
import SnapKit

// ViewController에서

final class ImageSettingCollectionViewCell: BaseCollectionViewCell {
    private let circleView = ProfileCircleView(frame: .zero).then {
        $0.backgroundColor = Color.backColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        DispatchQueue.main.async {
            self.circleView.layer.cornerRadius = self.circleView.frame.width / 2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.contentView.addSubview(circleView)
    }
    
    override func configureLayout() {
        self.circleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ImageSettingCollectionViewCell {
    func configureCell(image: UIImage) {
        self.circleView.profileImageView.image = image
    }
    
    func selectedCell() {
        self.circleView.backgroundColor = Color.pointColor
    }
    
    func deSelectedCell() {
        self.circleView.backgroundColor = Color.backColor
    }
}
