//
//  NetworkManager+Home.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getMoviesList(page: Int, completion: @escaping(_ result: Swift.Result<NetworkResponse<Movie>, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(HomeService
            .getMoviesList(page: page))) { result in
                self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
