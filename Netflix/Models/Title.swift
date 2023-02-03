//
//  Movie.swift
//  Netflix
//
//  Created by Владислав Калинин on 27.11.2022.
//

import Foundation



struct TrendingTitleResponse: Codable {
    
    // MARK: PROPERTY
    
    let results: [Title]
}

struct Title: Codable {
    
    // MARK: PROPERTY
    
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

