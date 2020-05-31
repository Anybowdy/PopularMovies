//
//  MoviesVC.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {

    // MARK: - Properties
    
    var movies: [Movie] = []
    var pageNumber = 1
    var maxPage = 0
    var isFetching: Bool = false
    
    // MARK: - Outlets

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()

        fetchPopularMovies(page: 1)
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        moviesCollectionView.backgroundColor = UIColor(hue: 0.5889, saturation: 0.29, brightness: 0.24, alpha: 1.0)
    }
    
    // MARK: - UI
    
    func setUpNavigationBar() {
        self.navigationItem.title = "POPULAR MOVIES 🍿🎬"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 255/255, green: 65/255, blue: 79/255, alpha: 1.0)
    }
        
    // MARK: - Fetch data
    
    func fetchPopularMovies(page: Int) -> () {
        self.isFetching = true
        let popularMovieURL = "https://api.themoviedb.org/3/movie/popular?"
        let apiKey = "api_key=776393d9cf2a6acb013d61f7d8964436"
        let specifyPage = "&page="
        let pageNumber = String(page)
        guard let jsonUrlString = URL(string: popularMovieURL + apiKey + specifyPage + pageNumber) else { return }
        URLSession.shared.dataTask(with: jsonUrlString) { (data, response, error ) in
            guard let data = data else { return }
            do {
                let fetchedMovies = try JSONDecoder().decode(Movies.self, from: data)
                self.movies.append(contentsOf: fetchedMovies.results)
                self.maxPage = fetchedMovies.total_pages
                self.pageNumber += 1
                DispatchQueue.main.async {
                    self.moviesCollectionView.reloadData()
                    self.isFetching = false
                }
            } catch let err {
                print(err)
            }
        }.resume()
        return
    }

}

// MARK: - UICollectionViewDelegate/Datasource

extension MoviesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.setUpTitle(title: movie.title)
        cell.setUpMovieImage(url: movie.poster_path)
        cell.setUpRate(average: movie.vote_average)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! MovieDetailsVC
        detailsVC.modalTransitionStyle = .crossDissolve
        detailsVC.modalPresentationStyle = .overCurrentContext
        detailsVC.movie = movies[indexPath.row]
        self.present(detailsVC, animated: true)
    }
    
}

// MARK: - UICollectionViewDeleageFlowLayout

extension MoviesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (moviesCollectionView.frame.width / 2) - 10, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // Infinite scrolling setup
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollYAxis = scrollView.contentOffset.y
        let scrollViewSize = scrollView.contentSize.height - scrollView.frame.height
        
        if (scrollYAxis > scrollViewSize && !isFetching && pageNumber <= maxPage) {
            fetchPopularMovies(page: pageNumber)
        }
    }
}
