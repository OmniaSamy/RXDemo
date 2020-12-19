//
//  HomeService.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

// swiftlint:disable all
enum HomeService {
    case getMoviesList(page: Int)
}

extension HomeService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getMoviesList:
            return "/movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMoviesList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .getMoviesList(let page):
            return .requestParameters(parameters: ["page": page,"api_key": NetworkManager.networkConfig.apiKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
//
//extension HomeService: AccessTokenAuthorizable {
//    
//    var authorizationType: AuthorizationType? {
//        return .bearer
//    }
//}
