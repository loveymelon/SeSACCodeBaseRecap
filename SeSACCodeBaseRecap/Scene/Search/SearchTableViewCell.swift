//
//  SearchTableViewCell.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/13/24.
//

import UIKit
import Then
import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    private let magImageView = InitialImageView(image: UIImage(systemName: "magnifyingglass")).then {
        $0.tintColor = Color.stringColor
    }
    private let searchLabel = UILabel().then {
        $0.textColor = Color.stringColor
    }
    
    private let deleteButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = Color.stringColor
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print(#function)
        
        configureUI()
        self.backgroundColor = Color.backColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}

extension SearchTableViewCell: ConfigureUIProtocol {
    func configureUI() {
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        self.contentView.addSubview(magImageView)
        self.contentView.addSubview(searchLabel)
        self.contentView.addSubview(deleteButton)
    }
    
    func configureLayout() {
        self.magImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
//            make.top.bottom.equalTo(self.contentView.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(30)
            make.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(14)
            make.width.equalTo(self.magImageView.snp.height)
        }
        
        self.searchLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            make.leading.equalTo(self.magImageView.snp.trailing).offset(20)
            make.height.equalTo(22)
        }
        
        self.deleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView.safeAreaLayoutGuide)
            make.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(8)
            make.width.height.equalTo(self.magImageView)
        }
    }
}

extension SearchTableViewCell {
    func configureCell(item: String) {
        self.searchLabel.text = item
    }
}
