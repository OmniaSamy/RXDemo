//
//  HomeViewModel.swift
//  RxDemo
//
//  Created by Omnia Samy on 18/12/2020.
//

import Foundation
import RxSwift

enum response<T: Codable> {
    case next(data: T)
    case error(error: NetworkError)
}

class HomeViewModel {
    
    var movieList: [Movie]?
    
    var movieListPubSub = PublishSubject<response<[Movie]>>()
    
    func getMovieList(page: Int) {
        // call api
        NetworkManager.shared.getMoviesList(page: page, completion: { (result: Result<NetworkResponse<Movie>, NetworkError>, _) in
            
            switch result {
            case .success(let data):
                print("data \(data)")
                self.movieList = data.results
                self.movieListPubSub.onNext(.next(data: data.results ?? []))
            case .failure(let error):
                print("error \(error)")
                self.movieListPubSub.onNext(.error(error: error))
            }
        })
    }
}
