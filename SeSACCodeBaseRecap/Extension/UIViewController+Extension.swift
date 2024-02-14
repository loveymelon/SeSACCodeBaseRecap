//
//  UIViewController+Extension.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 1/29/24.
//

import UIKit

enum TransitionStyle {
    case present
    case presentNavigation
    case presentFullNavigation
    case push
}

extension UIViewController {

    func transition<T: UIViewController>(style: TransitionStyle, viewController: UIViewController, type: T.Type) {
        guard let vc = viewController as? T else { return }
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        case .push:
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func eventAlert(title: String, message: String, cancle: String, accept: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancleButton = UIAlertAction(title: cancle, style: .cancel)
        let acceptButton = UIAlertAction(title: accept, style: .destructive)
        
        alert.addAction(cancleButton)
        alert.addAction(acceptButton)
        
        // 4. 띄우기
        present(alert, animated: true)
    }
}

