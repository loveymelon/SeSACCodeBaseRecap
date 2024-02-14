//
//  ProfileImageViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/11/24.
//

import UIKit

final class ProfileImageSettingViewController: BaseViewController {

    let mainView = ProfileImageSettingView()
    
    var imageData: ((String) -> Void)?
    
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
    
    override func addAction() {
        if mainView.circleView.profileImageView.image == nil {
            eventAlert(title: "오류", message: "이미지가 준비 되지않았습니다.", cancle: "취소", accept: "확인")
        }
    }
    
    override func delegateDataSource() {
        self.mainView.collectionView.delegate = self
        self.mainView.collectionView.dataSource = self
    }
    
}

extension ProfileImageSettingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSettingCollectionViewCell.identifier, for: indexPath) as? ImageSettingCollectionViewCell else {
            eventAlert(title: "오류", message: "셀 오류", cancle: "취소", accept: "확인")
            return UICollectionViewCell()
        }
        
        guard let imageItem = UIImage(named: "profile\(indexPath.item + 1)") else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(image: imageItem)
        
        if self.mainView.circleView.profileImageView.image == imageItem {
            self.mainView.collectionView.selectItem(at: [0, indexPath.item], animated: false, scrollPosition: .init())
            cell.selectedCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageSettingCollectionViewCell else { return }
        self.mainView.circleView.profileImageView.image = UIImage(named: "profile\(indexPath.item + 1)")
        imageData?("profile\(indexPath.item + 1)")
        cell.selectedCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageSettingCollectionViewCell else { return }
        
        cell.deSelectedCell()
    }
    
}
