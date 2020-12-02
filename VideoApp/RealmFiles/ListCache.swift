//
//  ListCache.swift
//  VideoApp
//
//  Created by Hooma7n on 12/2/20.
//

import Foundation
import RealmSwift

class MovieList : Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var year = ""
    @objc dynamic var url = ""
    @objc dynamic var type = ""
    @objc dynamic var selectedID = ""
    @objc dynamic var movieType = ""
    
}

class MovieDetailsDesc : Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var year = ""
    @objc dynamic var rated = ""
    @objc dynamic var released = ""
    @objc dynamic var runtime = ""
    @objc dynamic var genre = ""
    @objc dynamic var director = ""
    @objc dynamic var writer = ""
    @objc dynamic var actors = ""
    @objc dynamic var plot = ""
    @objc dynamic var language = ""
    @objc dynamic var country = ""
    @objc dynamic var awards = ""
    @objc dynamic var poster = ""
    @objc dynamic var ratings = ""
    @objc dynamic var metascore = ""
    @objc dynamic var imdbRating = ""
    @objc dynamic var imdbVotes = ""
    @objc dynamic var imdbID = ""
    @objc dynamic var type = ""
    @objc dynamic var dvd = ""
    @objc dynamic var boxOffice = ""
    @objc dynamic var production = ""
    @objc dynamic var website = ""
    @objc dynamic var response = ""    
    
}
