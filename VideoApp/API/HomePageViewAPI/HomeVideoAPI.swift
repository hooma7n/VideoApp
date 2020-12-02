//
//  HomeVideoAPI.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import Foundation
import Alamofire

class HomeVidesAPI {
    
    var tableData : [Search] = []
    
    func getfromapi(completionHandler : ((_ isSucess : Bool) -> Void)?) {
        
        // You can change genre from -> ShareData file in Extensions Folder
        let url = "http://omdbapi.com/?apikey=4f588b70&s=\(shareData.shared.selectedType)"
        
        print(url)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler : { response in
            
                switch response.result {
                
                case .success(let data):
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                    let decoder = JSONDecoder()
                    
                    guard let result = try? decoder.decode(Welcome.self, from: jsonData) else {return}
                                                           
                    self.tableData = result.search ?? []
                    
                    
                    completionHandler?(true)
                    
                case .failure(let x):
                    print(x)
                }
            })
    }
}

extension HomeVidesAPI {
    
    struct Welcome: Codable {
        let search: [Search]?
        let totalResults, response: String

        enum CodingKeys: String, CodingKey {
            case search = "Search"
            case totalResults
            case response = "Response"
        }
    }

    // MARK: - Search
    struct Search: Codable {
        let title, year, imdbID: String
        let type: TypeEnum
        let poster: String

        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID
            case type = "Type"
            case poster = "Poster"
        }
    }

    enum TypeEnum: String, Codable {
        case game = "game"
        case movie = "movie"
        case series = "series"
    }

}

