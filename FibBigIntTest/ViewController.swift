//
//  ViewController.swift
//  FibBigIntTest
//
//  Created by Алексей Малашенков on 04.03.17.
//  Copyright © 2017 Алексей Малашенков. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    let cellReuseIdentifier = "cell"
    let fib = Fibonachi.calcFibonachi(n: 300)
    var origanalArray = [String]()
    var searchingDataArray = [String]()
    var searching: Bool! = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        origanalArray = fib
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true {
            return searchingDataArray.count
        } else {
            return origanalArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MyCustomCell
        
        if searching == true {
            cell.myCellLabel.text = searchingDataArray[indexPath.row]
        } else {
            cell.myCellLabel.text = origanalArray[indexPath.row]
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingDataArray = origanalArray.filter({ (text) -> Bool in
            let tmp: String = text
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range != nil
        })
        if (searchingDataArray.count == 0) {
            searching = false
        } else {
            searching = true
        }
        self.tableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
