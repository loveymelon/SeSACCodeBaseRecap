//
//  SearchViewController.swift
//  SeSACCodeBaseRecap
//
//  Created by 김진수 on 2/13/24.
//

import UIKit

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureNav() {
        super.configureNav()
        self.navigationItem.title = "ddd님의 새싹쇼핑"
    }
    
    override func delegateDataSource() {
        self.mainView.searchBar.delegate = self
        
        self.mainView.searchTableView.delegate = self
        self.mainView.searchTableView.dataSource = self
        
//        self.mainView.searchTableView.rowHeight = UITableView.automaticDimension
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.mainView.searchDataArray.insert(searchBar.text!, at: 0)
        
        UserDefaultsCollectionManager.searchData = self.mainView.searchDataArray
//        let vc = storyboard?.instantiateViewController(identifier: SearchViewController.identifier) as! SearchViewController
//        vc.itemName = searchBar.text
//        self.navigationController?.pushViewController(vc, animated: true)
//        
//        self.searchBar.text = ""
//        self.view.endEditing(true)
    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        self.tapGesture.isEnabled = true
//    }
//    
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//        self.tapGesture.isEnabled = false
//        return true
//    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainView.searchDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let searchData = self.mainView.searchDataArray[indexPath.row]
        print(searchData)
        cell.configureCell(item: searchData)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
}
