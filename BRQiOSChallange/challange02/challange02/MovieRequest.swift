//
//  MovieRequest.swift
//  challange02
//
//  Created by Maria Luiza Carvalho Sperotto on 09/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import Foundation


struct Movie: Codable {
    var title: String
    var imdbID: Int
    //var Released: Int
    //var Genre: String
    //var Director: String
    
}


struct Movies: Codable {
    var results: [Movie]
}
