//
//  MoviesList.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation

class MoviesList: Codable {
    enum CodingKeys: String, CodingKey {
        case movies
    }
    
    var movies: [Movie] = []
}
