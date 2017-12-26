//
//  JCAlbumsTableViewController.swift
//  Ciber-Test
//
//  Created by johann casique on 23/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

class JCAlbumsViewController: UIViewController {
    
    // MARK: - Variables and Iboutlets
    @IBOutlet weak var tableView: UICollectionView!
    
    public var model: JCSearchModel?
    fileprivate var albumsArray = [JCCollections]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        
        if let model = self.model, let artistId = model.artistId {
            getData(withID: artistId)
        }
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    // MARK: - Private Methods
    private func getData(withID artistId:Int) {
       
        JCAlbumsServices.shared.getAlbums(withID: artistId) { (response) in
            switch response {
            case .Success(let data):
                self.albumsArray = data
                self.tableView.reloadData()
            case .Error(let err):
                print(err)
                self.showAlert(title: JCLanguage.Home.errorTitle, message: JCLanguage.Home.errorMessage)
            }
        }
    }

}


extension JCAlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: JCAlbumsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JCAlbumsCollectionViewCell
        
        cell.configAlbumsCell(albumsArray[indexPath.row])
        
        return cell
    }
}

extension JCAlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        JCNavigationManager.shared.showTracks(albumsArray[indexPath.row], sender: self)
    }
}


