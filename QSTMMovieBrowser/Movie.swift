//
//  Movie.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation

class Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case movieId
        case title
        case movieDescription
        case rating
        case duration
        case genre
        case releaseDate
        case trailerLink
        case movieLogoImage
    }
    var movieId: String = ""
    var title: String = ""
    var movieDescription: String = ""
    var rating: String = ""
    var duration: String = ""
    var genre: String = ""
    var releaseDate: String = ""
    var trailerLink: String = ""
    var movieLogoImage: String = ""
    
    var onWatchlist: Bool = false
    
    func dateToString(format: String) -> String {
        let date = releaseDate.stringToDate(format: "d MMMM yyyy")
        
        return date.dateToString(format: format)
    }
}
