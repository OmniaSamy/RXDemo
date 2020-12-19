//
//  MovieCell.swift
//  RxDemo
//
//  Created by Omnia Samy on 18/12/2020.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(movie: Movie) {
        let imageURL = "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "")
        movieImageView.loadImageFromUrl(urlString: imageURL, placeHolderImage: UIImage())
        movieNameLabel.text = movie.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        movieImageView.image = nil
    }
}
