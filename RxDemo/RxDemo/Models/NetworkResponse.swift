//
//  NetworkResponse.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    
    var page:Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [T]?
    var errors: [String]?
}
