//
//  MovieTableViewCell.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var addedToWatchlistLabel: UILabel!
    var onWatchlist: Bool = false {
        didSet {
            addedToWatchlistLabel.isHidden = !onWatchlist
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        movieImageView.layer.cornerRadius = 20.0
        movieImageView.addShadow()
        movieImageView.clipsToBounds = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
