//
//  BaseViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/10/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Color.backColor
        configureNav()
        delegateDataSource()
        addAction()
    }
    
    func configureNav() {
        
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = . white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 18)]
        
    }
    
    func delegateDataSource() {
        
    }
    
    func addAction() {
        
    }
    
}
