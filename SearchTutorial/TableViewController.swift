//
//  TableViewController.swift
//  SearchTutorial
//
//  Created by Suriya Reddy on 13/11/17.
//  Copyright © 2017 Suriya Reddy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {

    
    var array = ["Apple","Samsung","Google","LifeGood","Microsoft","Amazon","Flipkart"]
    
    var filteredArray = [String]()
    
    var searchController = UISearchController()
    var resultController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchController = UISearchController(searchResultsController: resultController)
        tableView.tableHeaderView = self.searchController.searchBar
        
        self.searchController.searchResultsUpdater = self
        
        self.resultController.tableView.delegate = self
        self.resultController.tableView.dataSource = self
        
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
        self.filteredArray = array.filter({ (array: String) -> Bool in
            
            if array.contains(searchController.searchBar.text!)
            {
                return true
            }
            else
            {
                return false
            }
            
        })
        
        self.resultController.tableView.reloadData()
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
      
        if tableView == resultController.tableView
        {
            return self.filteredArray.count
        }
        else
        {
            return self.array.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()

       
        if tableView == resultController.tableView
        {
           
            cell.textLabel?.text = self.filteredArray[indexPath.row]
        }
        else
        {
           cell.textLabel?.text = self.array[indexPath.row]
        }
        
        
       
        return cell
        
        

       
    }
    

}
