//
//  MoviesListViewModel.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation

class MovieListViewModel {
    var movieList: MoviesList = MoviesList()
    var delegate: MovieListViewModelDelegate?
    
    func fetchMovies() {
        if let movieList: MoviesList = CodableObjectFactory.objectFromPayload(MovieListDummyData.dummyMovieList) {
            self.movieList = movieList
            self.delegate?.didFinishFetching()
        }
    }
    
    func sortByTitle() {
        self.movieList.movies = self.movieList.movies.sorted(by: { $0.title < $1.title })
        self.delegate?.didFinishFetching()
    }
    
    func sortByReleaseDate() {
        self.movieList.movies = self.movieList.movies.sorted(by: {
            $0.releaseDate.stringToDate(format: "d MMMM yyyy") < $1.releaseDate.stringToDate(format: "d MMMM yyyy")
        })
        self.delegate?.didFinishFetching()
    }
}

protocol MovieListViewModelDelegate {
    func didFinishFetching()
}
