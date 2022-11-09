//
//  MovieListViewController.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewModelDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: MovieListViewModel!
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        addRightBarButton()
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    
        self.viewModel.delegate = self
        self.viewModel.fetchMovies()
    }
    
    private func addRightBarButton() {
        let sortBarButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(onSortButtonClick))
        navigationItem.rightBarButtonItem = sortBarButton
    }
    
    @objc func onSortButtonClick() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let titleButton = UIAlertAction(title: "Title", style: .default) { [unowned self] _ in
            self.viewModel.sortByTitle()
        }
        let releaseDateButton = UIAlertAction(title: "Release Date", style: .default) { [unowned self] _ in
            self.viewModel.sortByReleaseDate()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(titleButton)
        actionSheet.addAction(releaseDateButton)
        actionSheet.addAction(cancelButton)
        
        self.present(actionSheet, animated: true)
    }
    
    func didFinishFetching() {
        self.tableView.reloadData()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        let movieList = viewModel.movieList
        let movie = movieList.movies[indexPath.row]
        cell?.movieImageView.image = UIImage(named: movie.movieLogoImage)
        cell?.movieTitle.text = "\(movie.title) (\(movie.dateToString(format: "yyyy")))"
        cell?.genreLabel.text = "\(movie.duration) - \(movie.genre)"
        cell?.onWatchlist = movie.onWatchlist
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieList = viewModel.movieList
        let movie = movieList.movies[indexPath.row]
        let viewModel = MovieDetailsViewModel(movie: movie)
        let viewController = MovieDetailViewController(viewModel: viewModel)

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
