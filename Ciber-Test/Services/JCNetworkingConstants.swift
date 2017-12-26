//
//  JCNetworkingConstants.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import Alamofire


enum JCQuery {
    static var urlBase:String {return "https://itunes.apple.com/"}
    
    case search
    case amgArtist
    case searchID
    
    var path:String {
        switch self {
        case .search: return "search?term="
        case .amgArtist: return "/lookup?amgArtistId="
        case .searchID: return "/lookup?id="
        }
    }
    
    enum Entity {
        static let musicArtist = "&entity=musicArtist"
        static let album = "&entity=album"
        static let song = "&entity=song"
        static func limit(_ number:Int) -> String {return "&limit=\(number)"}
    }
    
}
