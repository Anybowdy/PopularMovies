//
//  MovieCell.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var movie: Movie!
    var genre: String!
    
    let apiImageUrl = "https://image.tmdb.org/t/p/w200/"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genreText: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var rateText: UILabel!
    
    
    func setUpCellDesign(movie: Movie, genre: String) {
        self.movie = movie
        self.genre = genre
        
        setUpCellBackgroundColor()
        setUpMovieImage()
        setUpTitle()
        setUpMovieImage()
        setUpRate()
        setUpGenreText()
    }
    
    
    private func setUpTitle() {
        self.title.text = movie.title
        self.title.textColor = UIColor.white
    }
    
    private func setUpGenreText() {
        self.genreText.textColor = UIColor.white
        self.genreText.text = genre
    }
    
    private func setUpRate() {
        self.rateText.text = String(format: "%.1f", (movie.vote_average / 2))
    }
    
    private func setUpMovieImage() {
        self.movieImage.layer.cornerRadius = 10
        
        guard let movieImageUrl = movie.poster_path else { return }
        guard let url = URL(string: self.apiImageUrl + movieImageUrl) else { return }
        do {
            let movieImageData = try Data(contentsOf: url)
            self.movieImage.image = UIImage(data: movieImageData)
        } catch {
            print("Image not laded")
        }
    }
    
    private func setUpCellBackgroundColor() {
        contentView.backgroundColor = UIColor.clear
    }
    
}
