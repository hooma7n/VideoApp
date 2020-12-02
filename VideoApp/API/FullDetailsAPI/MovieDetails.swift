//
//  MovieDetails.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import Foundation
import Alamofire

class MovieDetailsAPI {
    
    var tableData : WelcomeElement!
        
    func getfromapi(completionHandler : ((_ isSucess : Bool) -> Void)?) {
        
        let url = "http://omdbapi.com/?i=\(shareData.shared.selectedID)&apikey=d46b58e5"

        
            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                .responseJSON(completionHandler : { response in
                    
                    switch response.result {
                    
                    case .success(let data):
                        
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                        let decoder = JSONDecoder()
                        guard let result = try? decoder.decode(WelcomeElement.self, from: jsonData) else {return}
                        
                        self.tableData = result
                        
                        completionHandler?(true)
                        
                    case .failure(let x):
                        print(x)
                    }
                })
        }
        
    }
    
 
extension MovieDetailsAPI {
    
    struct WelcomeElement: Codable {
        let title, year, rated, released: String
        let runtime, genre, director, writer: String
        let actors, plot, language, country: String
        let awards: String
        let poster: String
        let ratings: [Rating]
        let metascore, imdbRating, imdbVotes, imdbID: String
        let type: TypeEnum
        let totalSeasons: String?
        let response: Response
        let dvd, boxOffice: BoxOffice?
        let production: String?
        let website: BoxOffice?

        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case rated = "Rated"
            case released = "Released"
            case runtime = "Runtime"
            case genre = "Genre"
            case director = "Director"
            case writer = "Writer"
            case actors = "Actors"
            case plot = "Plot"
            case language = "Language"
            case country = "Country"
            case awards = "Awards"
            case poster = "Poster"
            case ratings = "Ratings"
            case metascore = "Metascore"
            case imdbRating, imdbVotes, imdbID
            case type = "Type"
            case totalSeasons
            case response = "Response"
            case dvd = "DVD"
            case boxOffice = "BoxOffice"
            case production = "Production"
            case website = "Website"
        }
    }

    enum BoxOffice: String, Codable {
        case nA = "N/A"
    }

    // MARK: - Rating
    struct Rating: Codable {
        let source: Source
        let value: String

        enum CodingKeys: String, CodingKey {
            case source = "Source"
            case value = "Value"
        }
    }

    enum Source: String, Codable {
        case internetMovieDatabase = "Internet Movie Database"
        case metacritic = "Metacritic"
        case rottenTomatoes = "Rotten Tomatoes"
    }

    enum Response: String, Codable {
        case responseTrue = "True"
    }

    enum TypeEnum: String, Codable {
        case game = "game"
        case movie = "movie"
        case series = "series"
    }

    typealias Welcome = [WelcomeElement]
}
