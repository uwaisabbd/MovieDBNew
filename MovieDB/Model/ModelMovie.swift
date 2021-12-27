//
//  ModelMovie.swift
//  MovieDB
//
//  Created by Ayman Askari on 19/12/21.
//

import Foundation


struct DataResults: Codable {
    var id : Int
    var original_title: String
    var poster_path: String
    var vote_average: Double
}
