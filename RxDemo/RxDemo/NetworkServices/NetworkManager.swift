//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/6/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable all
class NetworkManager {
    
    typealias MoyaCompletion = Result<Moya.Response, MoyaError>
    typealias NetworkCompletion<T: Codable> = (_ result: Swift.Result<NetworkResponse<T>, NetworkError>,
        _ statusCode: Int?) -> Void
    
    static var networkConfig: NetworkDefaults {
        return NetworkManager.shared._networkConfig!
    }
    
    static var shared: NetworkManager!
    internal var _networkConfig: NetworkDefaults? //swiftlint:disable:this identifier_name
    
    var provider: MoyaProvider<MultiTarget>!
    
    
    init(config: NetworkDefaults) {
        
        self._networkConfig = config
        
        NetworkManager.shared = self
        
        let headerPlugin = StaticHeaderPlugin(
            headers: [
                "Content-Type": "application/json"
        ])
        
        provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(), headerPlugin])
    }
}

public struct StaticHeaderPlugin: PluginType {
    
    var headers: [String: String] = [:]
    
    public init(headers: [String: String]) {
        self.headers = headers
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        
        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
