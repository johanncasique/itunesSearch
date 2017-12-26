//
//  JCTrackTableViewCell.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit
import Kingfisher

class JCTrackTableViewCell: UITableViewCell {
    
    // MARK: - Variables and Iboutlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var genderNameLabel: UILabel!
    @IBOutlet weak var timeTackLabel: UILabel!
    
    // MARK: - Life Cycle
    public func configTrackCell(withModel model: JCTrack, index: IndexPath) {
        
        if let imageURL = model.artWork {
            if !imageURL.isEmpty {
                thumbnail.kf.setImage(with:URL(string:imageURL))
            }
        }
        trackNameLabel.text = model.trackName != nil ? model.trackName : ""
        genderNameLabel.text = model.primaryGender != nil ? model.primaryGender : ""
        timeTackLabel.text = model.trackTime != nil ? model.trackTime?.msToSeconds.minuteSecondMS : ""
        
        
    }
   
    
    // MARK: - SetupViews
    private func setupViews() {
        
    }
}

extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}

