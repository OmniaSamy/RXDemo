//
//  ViewController.swift
//  RxDemo
//
//  Created by Omnia Samy on 18/12/2020.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    let homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet private weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Movies"
        observe()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeTableView.register(UINib(nibName: MovieCell.className, bundle: nil),
                               forCellReuseIdentifier: MovieCell.className)
        self.homeViewModel.getMovieList(page: 1)
        observe()
    }
    
    private func observe() {
        
        homeViewModel.movieListPubSub.subscribe(onNext: { response in
            switch response {
            case .next(let data):
                print("from sitch \(data)")
                self.homeTableView.reloadData()
            case .error(let error):
                print("from switch  in viewcontroller\(error)")
            }
        }).disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MovieCell.className, for: indexPath) as? MovieCell,
              let movie = homeViewModel.movieList?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.bind(movie: movie)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
