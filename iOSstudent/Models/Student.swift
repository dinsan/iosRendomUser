//
//  Films.swift
//  iOSstudent
//
//  Created by Loord dinsan on 02/05/2019.
//  Copyright © 2019 Loord dinsan. All rights reserved.
//

import Foundation

class Student {
    let title: String
    let releaseYear: String
    let director: String
    let actors: [String]
    let summary: String
    init(_ title: String,
         releasedOn releaseYear:String,
         directedBy director:String,
         with actors:[String],
         description summary:String) {
        self.title = title
        self.releaseYear = releaseYear
        self.actors = actors
        self.director = director
        self.summary = summary
    }
}
