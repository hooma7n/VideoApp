//
//  VideosTVCell.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import UIKit

class VideosTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let cellIdentifier = "VideosTVCell"


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "VideosTVCell", bundle: nil)
    }
    
    @IBOutlet weak var cellBackView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellYearLabel: UILabel!
    @IBOutlet weak var cellMovieTypeLabel: UILabel!
    
    
    public func config(with viewModel : MovieListModel) {
        cellTitleLabel.setText(viewModel.name)
        cellYearLabel.setText(viewModel.year)
        cellMovieTypeLabel.setText(viewModel.type)
        cellImageView.kf.setImage(with : URL(string: viewModel.url ))
    }
    
    
}
