//
//  NetworkManager+ParseResponse.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

// swiftlint:disable all
extension NetworkManager {
    
    func parseResponse<T: Codable>(moyaResult: MoyaCompletion,
                                   completion: @escaping(NetworkCompletion<T>)) {
        
        switch moyaResult {
        case .success(let response):
            
            if (200...299 ~= response.statusCode) {
                do {
                    let result = try JSONDecoder().decode(NetworkResponse<T>.self, from: response.data)
                    completion(.success(result), response.statusCode)
                } catch {
                    completion(.failure(NetworkError(error: error)), response.statusCode)
                }
            } else {
                // 300-399 ,400-499
                do {
                    let error = try JSONDecoder().decode(NetworkResponse<Int>.self, from: response.data)
                    let errorList = error.errors
                    var businessError = NetworkError()
                    businessError.type = .business
                    businessError.statusCode = response.statusCode
                    businessError.message = businessError.getErrorMessage(errorsList: errorList ?? [])
                    completion(.failure(businessError), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            }
        case .failure(let error):
            let customError = NetworkError(error: error)
            completion(.failure(customError), nil)
        }
    }
}
