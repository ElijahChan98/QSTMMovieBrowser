//
//  MovieDetailsViewModel.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    var movie: Movie!
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func openTrailerUrl() {
        if let url = URL(string: movie.trailerLink) {
            UIApplication.shared.open(url)
        }
    }
    
    func addToWatchList() {
        movie.onWatchlist.toggle()
    }
}
