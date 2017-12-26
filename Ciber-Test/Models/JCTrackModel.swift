//
//  JCTrackModel.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JCTrack {
    
    let trackName: String?
    let artWork: String?
    let albumID: Int?
    let trackId: Int?
    let previewTrackURL: String?
    let trackTime:Int?
    let primaryGender: String?
}

class JCTrackModel {
    
    static let shared: JCTrackModel = JCTrackModel()
    
    public func extractTracks(_ data: [String:Any]) -> [JCTrack]? {
        
        let json = JSON(data)
        let results = json[resultsKey]
        
        guard var resultsArray = results.array else {return nil}
        
        resultsArray = resultsArray.sorted(by: {$0["releaseDate"] > $1["releaseDate"]})
        
        let model = resultsArray.filter {$0["wrapperType"] == "track"}.map {(JCTrack(trackName: $0["trackName"].string,
                                                                                     artWork: $0["artworkUrl100"].string,
                                                                                     albumID: $0["collectionId"].intValue,
                                                                                     trackId: $0["trackId"].intValue,
                                                                                     previewTrackURL: $0["trackViewUrl"].string,
                                                                                     trackTime: $0["trackTimeMillis"].int,
                                                                                     primaryGender: $0["primaryGenreName"].string))}
        
        
        return model
    }
}
