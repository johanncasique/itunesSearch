//
//  JCAlbumsModel.swift
//  Ciber-Test
//
//  Created by johann casique on 23/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JCCollections {
    let releaseDate: String?
    let albumName: String?
    let artWork: String?
    let albumID: Int?
}

class JCAlbumsModel {
    
    static let shared: JCAlbumsModel = JCAlbumsModel()
   
    public func extractAlbums(_ data: [String:Any]) -> [JCCollections]? {
        
        let json = JSON(data)
        let results = json[resultsKey]
        
        guard var resultsArray = results.array else {return nil}
        
        resultsArray = resultsArray.sorted(by: {$0["releaseDate"] > $1["releaseDate"]})
        
        let model = resultsArray.filter {$0["wrapperType"] == "collection"}.map {(JCCollections(releaseDate: $0["releaseDate"].string?.date,
                                                                                 albumName: $0["collectionName"].string,
                                                                                 artWork: $0["artworkUrl100"].string,
                                                                                 albumID: $0["collectionId"].intValue))}
        
       
        return model
    }
}


