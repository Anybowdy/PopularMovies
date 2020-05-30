//
//  MovieCell.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    let apiImageUrl = "https://image.tmdb.org/t/p/w200/"
    
    override func awakeFromNib() {
        setUpCellDesign()
    }
    
    func setUpTitle(title: String) {
        self.title.text = title
        self.title.textColor = UIColor.white
    }
    
    func setUpMovieImage(url: String?) {
        self.movieImage.layer.cornerRadius = 12
        
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
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(named: "black")?.cgColor
        
    }
    
}
