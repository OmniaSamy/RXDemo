//
//  NetworkError.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum `Type`:String, Codable {
    case business
    case system
    case mapping
    case auth
    case network
}

struct NetworkError: Error, Codable {
    
    var message: String?
    var innerErrors: [String]? // details
    var type: Type?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case message
        case innerErrors
        case type
        case statusCode
    }
    
    init() {}
    
    init(error: MoyaError) {
        
        self.message = error.errorDescription
        
        if case let MoyaError.underlying(underlying, _) = error ,
            case let AFError.sessionTaskFailed(error: urlErrorDomain) = underlying {
            self.message = urlErrorDomain.localizedDescription
        }
        
        // handel no inernet error message and session expire
        switch error {
        case .underlying(let error, _):
            self.type = .system
            print(error)
        default :
            print(error)
            print(error.localizedDescription)
            self.type = .mapping
        }
    }
    
    init(error: Error) {
        print(error)
        print(error.localizedDescription)
        self.type = .mapping
    }
}

extension NetworkError {
    
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        print(error.localizedDescription)
        return error
    }()
}

extension NetworkError {

//    func getErrorsValues() -> String {
//
//        let dect = self.innerErrors ?? [:]
//        var detailsValues = ""
//        for values in dect.values {
//            //            detailsValues += value
//            detailsValues += values.joined(separator: ",")
//            detailsValues += "\n"
//        }
//        return detailsValues
//    }
    
    func getErrorMessage(errorsList: [String]) -> String {
        
        let errorMessage = errorsList.joined(separator: ",")
        return errorMessage
    }
}
