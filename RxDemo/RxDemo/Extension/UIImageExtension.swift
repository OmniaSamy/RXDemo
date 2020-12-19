//
//  UIImageExtension.swift
//  MoviesApp
//
//  Created by Omnia Samy on 9/7/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    
    func loadImageFromUrl(urlString: String,
                          placeHolderImage: UIImage?,
                          animation: ImageTransition = .crossDissolve(0.2)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        self.af.setImage(withURL: url,
                         placeholderImage: placeHolderImage,
                         filter: nil,
                         imageTransition: animation)
    }
}
