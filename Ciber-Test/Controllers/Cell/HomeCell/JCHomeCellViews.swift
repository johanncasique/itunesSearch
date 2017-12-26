//
//  JCHomeCellViews.swift
//  Ciber-Test
//
//  Created by johann casique on 26/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import UIKit

extension JCHomeTableViewCell {
    // MARK: - SetupViews
    func setupViews() {
        
        
        artistName.font = Styles.Fonts.JCHelveticaNeueBold(size: 20)
        artistName.textColor = Styles.Colors.Black.titleBlack
        
        
        genderName.font = Styles.Fonts.JCHelveticaNeue(size: 14)
        genderName.textColor = Styles.Colors.Grey.subtitleGrey
        
        albumLabel.font = Styles.Fonts.JCHelveticaNeueBold(size: 25)
        albumLabel.textColor = Styles.Colors.Black.titleBlack
        
        artwork1.layer.cornerRadius = 10
        artwork1.layer.borderColor = UIColor.lightGray.cgColor
        artwork1.layer.borderWidth = 0.2
        
        collectionName1.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        collectionName1.textColor = Styles.Colors.Black.titleBlack
        
        releaseDate1.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        releaseDate1.textColor = Styles.Colors.Grey.subtitleGrey
        
        artwork2.layer.cornerRadius = 10
        artwork2.layer.borderColor = UIColor.lightGray.cgColor
        artwork2.layer.borderWidth = 0.2
        
        collectionName2.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        collectionName2.textColor = Styles.Colors.Black.titleBlack
        
        releaseDate2.font = Styles.Fonts.JCHelveticaNeue(size: 12)
        releaseDate2.textColor = Styles.Colors.Grey.subtitleGrey
        
        
        backViewArtwork1.albumConfig()
        backViewArtwork2.albumConfig()
        
        moreAlbumButton.setTitle("Discografia", for: .normal)
        moreAlbumButton.titleLabel?.font = Styles.Fonts.JCHelveticaNeueBold(size: 20)
        moreAlbumButton.setTitleColor(Styles.Colors.Black.titleBlack, for: .normal)
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icArrow"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: moreAlbumButton.frame.size.width - 32, y: 12, width: 24, height: 24)
        moreAlbumButton.addSubview(imageView)
        
        
        backView.shadow(withColor:Styles.Colors.Black.black28)
        backView.layer.cornerRadius = 10
    }
}
