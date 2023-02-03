//
//  YoutubeSearchResponse.swift
//  Netflix
//
//  Created by Владислав Калинин on 05.12.2022.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    
    let items: [VideoElement]
}

struct VideoElement: Codable {
    
    let id: IdVideoElement
    let etag: String
}

struct IdVideoElement: Codable {
    
    let kind: String
    let videoId: String
}

