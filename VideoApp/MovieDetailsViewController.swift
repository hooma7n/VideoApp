//
//  MovieDetailsViewController.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit
import RealmSwift

class MovieDetailsViewController: UIViewController {
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in realm.objects(MovieDetailsDesc.self).filter("imdbID == '\(shareData.shared.selectedID)'") {
            
            self.config(with: movieModel(headerImageView: i.poster , title: i.title, plot: i.plot, imdbRating: i.imdbRating, imdbVote: i.imdbVotes, country: i.country, genre: i.genre, director: i.director, writer: i.writer, production: i.production, actors: i.actors, rated: i.rated, year: i.year, imdbID: i.imdbID, id: i.id))
        }
        
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func config(with viewModel : movieModel) {
        
        titleLabel.setText(viewModel.title)
        
        
        yearLabel.text = viewModel.year
        headerImageView.kf.setImage(with: URL(string: viewModel.headerImageView))
        imdbVotesLabel.text = viewModel.imdbVote
        countryLabel.text = viewModel.country
        imdbScoreLabel.text = viewModel.imdbRating
        genreLabel.text = viewModel.genre
        actorLabels.text = viewModel.actors
        directorLabel.text = viewModel.director
        writerLabel.text = viewModel.writer
        productionLabel.text = viewModel.production
        ratedLabel.text = viewModel.rated
        
    }
    
    
    //add here
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var imdbVotesLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var imdbScoreLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var actorLabels: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var productionLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
}

struct movieModel {
    
    let headerImageView : String
    let title : String
    let plot : String
    let imdbRating : String
    let imdbVote : String
    let country : String
    let genre : String
    let director : String
    let writer : String
    let production : String
    let actors : String
    let rated : String
    let year : String
    let imdbID : String
    let id : String
    
}
