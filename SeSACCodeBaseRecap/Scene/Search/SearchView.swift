//
//  SearchView.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/13/24.
//

import UIKit
import Then
import SnapKit

class SearchView: BaseView {

    let searchBar = UISearchBar(frame: .zero).then {
        $0.searchTextField.setPlaceholder(string: "브랜드, 상품, 프로필, 태그 등", color: .systemGray2)
        $0.searchTextField.backgroundColor = .gray
        $0.barTintColor = .black
    }
    
    let emptyView = EmptyView()
    
    let searchTableView = UITableView(frame: .zero).then {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.backgroundColor = Color.backColor
    }
    
    let recentLabel = UILabel().then {
        $0.text = "최근 검색"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = Color.stringColor
    }
    
    let removeButton = UIButton().then {
        $0.setTitle("모두 지우기", for: .normal)
        $0.setTitleColor(Color.pointColor, for: .normal)
    }
    
    var searchDataArray = UserDefaultsCollectionManager.searchData ?? [] {
        didSet {
            self.searchTableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.addSubview(searchBar)
        self.addSubview(recentLabel)
        self.addSubview(removeButton)
        
        if searchDataArray.isEmpty {
            self.addSubview(emptyView)
        } else {
            self.addSubview(searchTableView)
        }
        
    }
    
    override func configureLayout() {
        self.searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(30)
        }
        
        self.recentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.searchBar.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(22)
        }
        
        self.removeButton.snp.makeConstraints { make in
            make.top.equalTo(self.recentLabel)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(22)
        }
        
        if searchDataArray.isEmpty {
            self.emptyView.snp.makeConstraints { make in
                make.top.equalTo(self.recentLabel.snp.bottom)
                make.horizontalEdges.bottom.equalToSuperview()
            }
        } else {
            self.searchTableView.snp.makeConstraints { make in
                make.top.equalTo(self.recentLabel.snp.bottom).offset(10)
                make.horizontalEdges.bottom.equalToSuperview()
            }
        }
        
        
    }
    
}
