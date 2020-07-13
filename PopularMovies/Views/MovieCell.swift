//
//  MovieCell.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var movie: Movie! {
        didSet {
            setUpMovieImage()
            
            self.title.text = movie.title
            self.rateText.text = String(format: "%.1f", (movie.vote_average / 2))
        }
    }
    var genre: String! = "" {
        didSet {
            self.genreText.text = genre
        }
    }
    
    let apiImageUrl = "https://image.tmdb.org/t/p/w200/"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genreText: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var rateText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.textColor = UIColor.white
        self.genreText.textColor = UIColor.white
        self.movieImage.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.clear

    }
    
    private func setUpMovieImage() {
        
        guard let movieImageUrl = movie.poster_path else { return }
        guard let url = URL(string: self.apiImageUrl + movieImageUrl) else { return }
        do {
            let movieImageData = try Data(contentsOf: url)
            self.movieImage.image = UIImage(data: movieImageData)
        } catch {
            print("Image not laded")
        }
    }
    
}
