//
//  ViewController.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit
import Kingfisher
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    var dataModel = HomeVidesAPI()
    
    var movieDataModel = MovieDetailsAPI()
    var model : MovieDetailsAPI.WelcomeElement!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.realm.objects(MovieList.self).count > 0 && self.realm.objects(MovieList.self).filter(" movieType == '\(shareData.shared.selectedType)'").count > 0 {
            cacheModel()
            
            
        } else {
            
            dataModel.getfromapi { (finish) in
                if finish {
                    self.cacheModel()
                    self.moviesTableView.reloadData()
                    
                    for i in self.realm.objects(MovieList.self).filter(" movieType == '\(shareData.shared.selectedType)'") {
                        shareData.shared.selectedID = i.selectedID
                        
                        self.movieDataModel.getfromapi { (finish) in
                            if finish {
                                self.saveMovieInfo()
                            }
                        }
                    }
                }
            }
        }
        
        setContainers()
        
    }
    
    //caching movie inside details Model
    func saveMovieInfo() {
        
        self.model = self.movieDataModel.tableData
        
        try! self.realm.write {
            let movieDetails : MovieDetailsDesc = MovieDetailsDesc()
            
            
            movieDetails.title = model.title
            movieDetails.actors = model.actors
            movieDetails.awards = model.awards
            movieDetails.boxOffice = model.boxOffice?.rawValue ?? ""
            movieDetails.country = model.country
            movieDetails.director = model.director
            movieDetails.dvd = model.dvd?.rawValue ?? ""
            movieDetails.genre = model.genre
            movieDetails.imdbID = model.imdbID
            movieDetails.imdbRating = model.imdbRating
            movieDetails.imdbVotes = model.imdbVotes
            movieDetails.language = model.language
            movieDetails.metascore = model.metascore
            movieDetails.plot = model.plot
            movieDetails.production = model.production ?? ""
            movieDetails.rated = model.rated
            movieDetails.poster = model.poster
            movieDetails.released = model.released
            movieDetails.runtime = model.runtime
            movieDetails.type = model.type.rawValue
            movieDetails.website = model.website?.rawValue ?? ""
            movieDetails.writer = model.writer
            movieDetails.year = model.year
            
            realm.add(movieDetails)
                        
        }
        
    }
    
    
    //caching movie list
    func cacheModel(){
        for i in 0..<self.dataModel.tableData.count {
            
            try! self.realm.write {
                
                let movieCache : MovieList = MovieList()
                movieCache.title = self.dataModel.tableData[i].title
                movieCache.type = self.dataModel.tableData[i].type.rawValue
                movieCache.url = self.dataModel.tableData[i].poster
                movieCache.year = self.dataModel.tableData[i].year
                movieCache.selectedID = self.dataModel.tableData[i].imdbID
                movieCache.movieType = shareData.shared.selectedType
                
                self.realm.add(movieCache)
                
            }
            self.moviesTableView.reloadData()
        }
    }
    
    
    func setContainers(){
        
        self.moviesTableView.delegate = self
        self.moviesTableView.registerCell("VideosTVCell")
        self.moviesTableView.register(VideosTVCell.nib(), forCellReuseIdentifier: VideosTVCell.cellIdentifier)
        
    }
    
    //add here
    @IBOutlet weak var moviesTableView: UITableView!
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //cells count loading from realm file with filter of selected genre
        let items : Results<MovieList> = {
            realm.objects(MovieList.self).filter(" movieType == '\(shareData.shared.selectedType)'")
        }()
        
        return items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: VideosTVCell.cellIdentifier, for: indexPath) as! VideosTVCell
        
        let items : Results<MovieList> = { realm.objects(MovieList.self).filter(" movieType == '\(shareData.shared.selectedType)'") }()
        let model = items[indexPath.row]
        cell.selectionStyle = .none
        cell.config(with: MovieListModel(name: model.title, year: model.year, type: model.type , url: model.url, selectedID: model.selectedID, movieType: shareData.shared.selectedType))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let items : Results<MovieList> = { realm.objects(MovieList.self).filter(" movieType == '\(shareData.shared.selectedType)'") }()
        let model = items[indexPath.row]
        shareData.shared.selectedID = model.selectedID
        
        self.performingSegue("NavigateDetails")
        
    }
    
    
}


struct MovieListModel {
    
    let name : String
    let year : String
    let type : String
    let url : String
    let selectedID : String
    let movieType : String
    
    
}
