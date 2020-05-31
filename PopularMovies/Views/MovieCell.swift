//
//  MovieCell.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    let apiImageUrl = "https://image.tmdb.org/t/p/w200/"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var rateText: UILabel!
    
    override func awakeFromNib() {
        setUpCellDesign()
    }
    
    func setUpTitle(title: String) {
        self.title.text = title
        self.title.textColor = UIColor.white
    }
    
    func setUpRate(average: Float) {
        self.rateText.text = String(format: "%.1f", (average / 2))
    }
    
    func setUpMovieImage(url: String?) {
        self.movieImage.layer.cornerRadius = 10
        
        guard let movieImageUrl = url else { return }
        guard let url = URL(string: self.apiImageUrl + movieImageUrl) else { return }
        do {
            let movieImageData = try Data(contentsOf: url)
            self.movieImage.image = UIImage(data: movieImageData)
        } catch {
            print("Image not laded")
        }
    }
    
    private func setUpCellDesign() {
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.backgroundColor = UIColor.clear
    }
    
}
