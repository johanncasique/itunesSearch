//
//  HomeTableViewCell.swift
//  Ciber-Test
//
//  Created by johann casique on 23/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit
import Kingfisher

class JCHomeTableViewCell: UITableViewCell {
    
    // MARK: - Variables and Iboutlets
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var genderName: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artwork1: UIImageView!
    @IBOutlet weak var collectionName1: UILabel!
    @IBOutlet weak var releaseDate1: UILabel!
    @IBOutlet weak var artwork2: UIImageView!
    @IBOutlet weak var collectionName2: UILabel!
    @IBOutlet weak var releaseDate2: UILabel!
    @IBOutlet weak var moreAlbumButton: UIButton!
    @IBOutlet weak var backView: JCView!
    @IBOutlet weak var backViewArtwork1: JCView!
    @IBOutlet weak var backViewArtwork2: JCView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
       
        setupViews()
    }
    
    
    // MARK: - Life Cycle
    public func homeCell(withModel model:JCSearchModel, index: IndexPath) {
        
        artistName.text = model.artistName != nil ? model.artistName : ""
        artistName.tag = index.row
        
        genderName.text = model.primaryGenreName != nil ? model.primaryGenreName : ""
        genderName.tag = index.row
        
        headerView.tag = index.row
        arrowImage.tag = index.row
        moreAlbumButton.tag = index.row
        
        albumLabel.text = "Albums"
        if let collection = model.collections {
            if let artwork = collection[1].artWork, let albumName = collection[1].albumName, let releaseDate = collection[1].releaseDate {
                artwork1.kf.setImage(with: URL(string:artwork))
                collectionName1.text = albumName
                releaseDate1.text = releaseDate
            }
            if let artwork = collection[2].artWork, let albumName = collection[2].albumName, let releaseDate = collection[2].releaseDate {
                artwork2.kf.setImage(with: URL(string:artwork))
                collectionName2.text = albumName
                releaseDate2.text = releaseDate
            }
        }
        if let moreAlbums = model.isMoreCollections {
            moreAlbumButton.isHidden = moreAlbums == true ? false : true
        }
    }
    
    
}

