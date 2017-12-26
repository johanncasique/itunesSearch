//
//  ViewController.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

let HomeCellIdentifier = "HomeCell"

class JCMasterViewController: UIViewController {
    
    // MARK: - IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchResult = [JCSearchModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
        setupViews()
    }
    
    // MARK: - Private instance methods
    private func setupViews() {
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = JCLanguage.Home.searchPlaceholder
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        title = JCLanguage.Home.title
    }
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    fileprivate func getResult(_ text:String) {
        JCSearchService.shared.getSearch(withText: text) { (response) in
            switch response {
            case .Success(let data):
                self.searchResult = data
                self.tableView.reloadData()
            case .Error(let err):
                print(err)
                self.showAlert(title: JCLanguage.Home.errorTitle, message: JCLanguage.Home.errorMessage)
            }
        }
    }
    
    // MARK: - Ibactions

    @IBAction func headerAction(_ sender: UIGestureRecognizer) {
        JCNavigationManager.shared.showAlbums(searchResult[(sender.view?.tag)!])
    }
    
    @IBAction func moreAlbumAction(_ sender: UIButton) {
        JCNavigationManager.shared.showAlbums(searchResult[sender.tag])
    }
    
}

extension JCMasterViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: JCHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeCellIdentifier, for: indexPath) as! JCHomeTableViewCell
        cell.homeCell(withModel: searchResult[indexPath.row], index: indexPath)
        
        return cell
    }
    
}



extension JCMasterViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        guard let text = searchController.searchBar.text  else {return}
        getResult(text.replacingOccurrences(of: " ", with: "+"))
    }
}
