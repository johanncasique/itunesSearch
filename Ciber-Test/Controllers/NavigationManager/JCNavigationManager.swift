//
//  JCNavigationManager.swift
//  Ciber-Test
//
//  Created by johann casique on 26/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

final class JCNavigationManager {
    
    static let shared: JCNavigationManager = JCNavigationManager()
    
    public func showAlbums(_ model:JCSearchModel) {
        let albumsVC: JCAlbumsViewController = UIStoryboard(name: "JCAlbumsViewController", bundle: nil).instantiateViewController(withIdentifier: "JCAlbumsViewController") as! JCAlbumsViewController
        albumsVC.model = model
        albumsVC.title = model.artistName
        UIApplication.shared.keyWindow?.rootViewController?.show(albumsVC, sender: self)
    }
    
    public func showTracks(_ model:JCCollections, sender: UIViewController) {
        let tracksVC: JCTrackViewController = UIStoryboard(name: "JCTrackViewController", bundle: nil).instantiateViewController(withIdentifier: "JCTrackViewController") as! JCTrackViewController
        tracksVC.collectionModel = model
        tracksVC.title = model.albumName
        sender.show(tracksVC, sender: sender)
    }
    
}
