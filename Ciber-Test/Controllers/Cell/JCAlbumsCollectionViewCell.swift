//
//  JCAlbumsCollectionViewCell.swift
//  Ciber-Test
//
//  Created by johann casique on 23/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit
import Kingfisher

class JCAlbumsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables and Iboutlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var albumNamelabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
         setupViews()
    }
    
    // MARK: - Life Cycle
    public func configAlbumsCell(_ model: JCCollections) {
        
       
        
        if let artwork = model.artWork, let albumName = model.albumName, let releaseDate = model.releaseDate {
            thumbnail.kf.setImage(with: URL(string:artwork))
            albumNamelabel.text = albumName
            releaseDateLabel.text = releaseDate
        }
       
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        
        
        thumbnail.thumbnailConfig()
        
        albumNamelabel.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        albumNamelabel.textColor = Styles.Colors.Black.titleBlack
        
        releaseDateLabel.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        releaseDateLabel.textColor = Styles.Colors.Grey.subtitleGrey
        
    }
}
