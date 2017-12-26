//
//  JCTrackService.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation

class JCTrackService {
    
    static let shared: JCTrackService = JCTrackService()
    
    typealias JCTracksCompletionBlock = (ServerResponse<[JCTrack]>) -> Void
    
    public func getTracks(withID artistId:Int, completionBlock: @escaping JCTracksCompletionBlock) {
        
        JCNetworking.shared.request(endpoint: "\(JCQuery.searchID.path)\(artistId)\(JCQuery.Entity.song)").responseValidatedJson { (response) in
            
            if let result = response?.result, let value = result.value {
                if let model = JCTrackModel.shared.extractTracks(value) {
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
