//
//  YoutubeSearchResponse.swift
//  Netflix
//
//  Created by Владислав Калинин on 05.12.2022.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    
// MARK: PROPERTIES
    
    let items: [VideoElement]
}

struct VideoElement: Codable {

// MARK: PROPERTIES
    
    let id: IdVideoElement
    let etag: String
}

struct IdVideoElement: Codable {
    
// MARK: PROPERTIES
    
    let kind: String
    let videoId: String
}

