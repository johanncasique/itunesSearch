//
//  JCSearchModel.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import SwiftyJSON

let resultsKey = "results"
let amgArtistId = "amgArtistId"
typealias JCIdString = String


struct JCSearchModel {
    let artistId: Int?
    let artistName: String?
    let primaryGenreName: String?
    let collections: [JCCollections]?
    let isMoreCollections: Bool?
    
}



class JCSearchModelExtract {
    
    static let shared: JCSearchModelExtract = JCSearchModelExtract()
    
    public func getIdArtist(withJSON data: [String:Any]) -> JCIdString? {
        
        let json = JSON(data)
        let results = json[resultsKey]
        
        guard let resultsArray = results.array else {return nil}
        let idEndpoint = resultsArray.filter {$0[amgArtistId] != JSON.null}.map {"\($0[amgArtistId])"}.joined(separator: ",")
        
        let endpoint = "\(JCQuery.amgArtist.path)\(idEndpoint)\(JCQuery.Entity.album)\(JCQuery.Entity.limit(5))" as JCIdString
        
        return endpoint
    }
    
    public func extractSearch(withJSON data: [String:Any]) -> [JCSearchModel]? {
        
        var modelArray = [JCSearchModel]()
        
        let json = JSON(data)
        let results = json[resultsKey]
        guard let resultsArray = results.array else {return nil}
        
        let dicArray = resultsArray.map{$0["artistId"]}
        
        for (indexArr, value) in resultsArray.enumerated(){
            if dicArray[indexArr] == value["artistId"] {
                
                var tempArray = [JCCollections]()
                for album in resultsArray.enumerated() {
                    if dicArray[indexArr] == album.element["artistId"] {
                        tempArray.append(JCCollections(releaseDate: album.element["releaseDate"].string?.date,
                                                       albumName: album.element["collectionName"].string,
                                                       artWork: album.element["artworkUrl100"].string,
                                                       albumID: album.element["collectionId"].intValue))
                    }
                }
                if tempArray.count >= 3 {
                    if !modelArray.contains(where: {$0.artistId == value["artistId"].intValue}){
                        
                        modelArray.append(JCSearchModel(artistId: value["artistId"].intValue,
                                                        artistName: value["artistName"].string,
                                                        primaryGenreName: value["primaryGenreName"].string,
                                                        collections: tempArray,
                                                        isMoreCollections:tempArray.count > 2 ? true: false))
                    }
                    tempArray.removeAll()
                }
            }
        }
      
        return modelArray
    }
    
}


