//
//  QSTMMovieBrowserTests.swift
//  QSTMMovieBrowserTests
//
//  Created by Elijah Chan on 11/9/22.
//

import XCTest
@testable import QSTMMovieBrowser

class QSTMMovieBrowserTests: XCTestCase {
    func testExtensions() {
        let testDateString = "11 June 1997"
        
        var dateComponents = DateComponents()
        dateComponents.year = 1997
        dateComponents.month = 6
        dateComponents.day = 11

        let userCalendar = Calendar(identifier: .gregorian)
        let testDateTime = userCalendar.date(from: dateComponents)
        
        let convertedDate = testDateString.stringToDate(format: "dd MMMM yyyy")
        XCTAssert(testDateTime == convertedDate)
        
        let convertedDateString = convertedDate.dateToString(format: "dd MMMM yyyy")
        XCTAssert(convertedDateString == testDateString)
    }
    
    func testCodableObjectFactory() {
        let sampleData = MovieListDummyData.dummyMovieList
        guard let movieList: MoviesList = CodableObjectFactory.objectFromPayload(MovieListDummyData.dummyMovieList) else {
            XCTFail()
            return
        }
        XCTAssert(movieList.movies.count > 0)
        
        let movieListVm = MovieListViewModel()
        movieListVm.fetchMovies()
        XCTAssert(movieListVm.movieList.movies.first!.title == "Tenet")
        movieListVm.sortByTitle()
        XCTAssert(movieListVm.movieList.movies.first!.title == "Avengers: Age of Ultron")
        movieListVm.sortByReleaseDate()
        XCTAssert(movieListVm.movieList.movies.first!.title == "Guardians of the Galaxy")
        
        let movieDetailsVm = MovieDetailsViewModel(movie: movieListVm.movieList.movies.first!)
        movieDetailsVm.addToWatchList()
        XCTAssert(movieDetailsVm.movie.onWatchlist == true)
    }

}
