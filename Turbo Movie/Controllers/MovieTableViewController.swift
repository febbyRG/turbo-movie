//
//  MovieTableViewController.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewController: UITableViewController, NetworkManagerDelegate {
    
    let networkManager = NetworkManager()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var arrayMovies = [Movie]()
    
    func didSuccessRequest(responseObject: Dictionary<String, AnyObject>) {
        if let data = responseObject["data"] {
            if let movies = data["movies"] as? [Dictionary<String, AnyObject>] {
                for data in movies {
                    if let movie = Movie(data: data) {
                        arrayMovies.append(movie)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func didFailedRequest(errorInfo: String) {
        print("error = \(errorInfo)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        getMovies()
    }
    
    func initialize() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        networkManager.delegate = self
        
        activityIndicator.startAnimating()
        self.tableView.backgroundView = activityIndicator
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
    }
    
    func getMovies() {
        networkManager.request(parameters: nil, url: "https://yts.mx/api/v2/list_movies.json", method: Constants.REQUEST_GET)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! MovieTableViewCell

        let movie = arrayMovies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieGenre.text = movie.genre
        cell.movieImage.sd_setImage(with: URL(string: movie.cover), completed: nil)
        
        return cell
    }

}
