//
//  Movie.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var poster_path: String?
    var id: Int?
    var adult: Bool?
    var backdrop_path: String?
    var original_language: String?
    var original_title: String?
    var genre_ids: [Int]?
    var title: String?
    var vote_average: Double?
    var overview: String?
    var release_date: String?
}
