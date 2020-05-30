//
//  Movie.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import Foundation
import UIKit

struct Movies: Decodable {
    let total_pages: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let popularity: Float
    let poster_path: String?
    let backdrop_path: String?
    let title: String
    let overview: String
    let release_date: String
}
