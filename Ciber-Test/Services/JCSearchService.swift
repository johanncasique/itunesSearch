//
//  JCSearchService.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation



class JCSearchService: NSObject {
    
    static let shared: JCSearchService = JCSearchService()
    
    typealias JCSearchCompletionBlock = (ServerResponse<[JCSearchModel]>) -> Void
    
    public func getSearch(withText searchText:String, completionBlock: @escaping JCSearchCompletionBlock) {
        
        let endpoint = "\(JCQuery.search.path)\(searchText)\(JCQuery.Entity.musicArtist)"
        
        JCNetworking.shared.request(endpoint: endpoint).responseValidatedJson { (response) in
            //print(response?.result?.value)
            guard let endPoint = JCSearchModelExtract.shared.getIdArtist(withJSON: (response?.result?.value)!) else {return}
            
            JCNetworking.shared.request(endpoint: endPoint).responseValidatedJson { (response) in
                
                if let result = response?.result, let value = result.value {
                    if let model = JCSearchModelExtract.shared.extractSearch(withJSON: value) {
                        completionBlock(.Success(model))
                    }else{
                        completionBlock(.Error("No Result"))
                    }
                }else{
                    completionBlock(.Error("Error"))
                }
                
            }
        }
    }
    
}


