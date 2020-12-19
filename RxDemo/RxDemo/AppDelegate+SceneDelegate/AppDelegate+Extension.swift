//
//  AppDelegate.swift
//  RxDemo
//
//  Created by Omnia Samy on 18/12/2020.
//

import Foundation

extension AppDelegate {
    
    func initNetwork() {
        
        let defaults = NetworkDefaults(baseUrl: "https://api.themoviedb.org/3",
                                       apiKey: "81214f14b3b4fc4623c6b48bb307ab11"
        )
        
        NetworkManager.shared = NetworkManager(config: defaults)
    }
}
