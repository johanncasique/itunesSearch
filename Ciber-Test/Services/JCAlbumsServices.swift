//
//  JCAlbumsServices.swift
//  Ciber-Test
//
//  Created by johann casique on 23/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation

class JCAlbumsServices {
    
    static let shared: JCAlbumsServices = JCAlbumsServices()
    
    typealias JCAlbumsCompletionBlock = (ServerResponse<[JCCollections]>) -> Void
    
    public func getAlbums(withID artistId:Int, completionBlock: @escaping JCAlbumsCompletionBlock) {
        
        JCNetworking.shared.request(endpoint: "\(JCQuery.searchID.path)\(artistId)\(JCQuery.Entity.album)").responseValidatedJson { (response) in
            
            if let result = response?.result, let value = result.value {
                if let model = JCAlbumsModel.shared.extractAlbums(value) {
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
