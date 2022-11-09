//
//  MovieDetailViewController.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var moveImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addToWatchlistButton: UIButton!
    @IBOutlet weak var watchTrailerButton: UIButton!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    private var viewModel: MovieDetailsViewModel!
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveImageView.layer.cornerRadius = 10.0
        moveImageView.addShadow()
        moveImageView.clipsToBounds = true
        setupButtons()
        populateLabels()
    }
    
    func setupButtons() {
        addToWatchlistButton.layer.cornerRadius = 15.0
        addToWatchlistButton.backgroundColor = .systemGray4
        addToWatchlistButton.titleLabel?.adjustsFontSizeToFitWidth = true
        addToWatchlistButton.titleLabel?.lineBreakMode = .byWordWrapping
        addToWatchlistButton.titleEdgeInsets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        addToWatchlistButton.titleLabel?.numberOfLines = 1
        
        watchTrailerButton.layer.cornerRadius = 15.0
        watchTrailerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        watchTrailerButton.titleLabel?.lineBreakMode = .byWordWrapping
        watchTrailerButton.backgroundColor = .clear
        watchTrailerButton.layer.borderWidth = 1
        watchTrailerButton.layer.borderColor = UIColor.black.cgColor
        watchTrailerButton.titleEdgeInsets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        watchTrailerButton.titleLabel?.numberOfLines = 1
    }
    
    func populateLabels() {
        moveImageView.image = UIImage(named: viewModel.movie.movieLogoImage)
        titleLabel.text = viewModel.movie.title
        
        let boldRating = viewModel.movie.rating
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attributedString = NSMutableAttributedString(string: boldRating, attributes: attrs)

        let normalText = "/10"
        let normalString = NSMutableAttributedString(string: normalText)

        attributedString.append(normalString)
        ratingLabel.attributedText = attributedString
        shortDescriptionLabel.text = viewModel.movie.movieDescription
        genreLabel.text = viewModel.movie.genre
        releaseDateLabel.text = viewModel.movie.releaseDate
        
        updateWatchListButton()
    }
    
    func updateWatchListButton() {
        if viewModel.movie.onWatchlist {
            addToWatchlistButton.setTitle("REMOVE FROM WATCHLIST", for: .normal)
        } else {
            addToWatchlistButton.setTitle("+ ADD TO WATCHLIST", for: .normal)
        }
    }

    @IBAction func onAddToWatchlistClick(_ sender: Any) {
        viewModel.addToWatchList()
        updateWatchListButton()
    }
    
    @IBAction func onWatchTrailerClick(_ sender: Any) {
        viewModel.openTrailerUrl()
    }
    
}
