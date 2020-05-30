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
    
    override func awakeFromNib() {
        setUpCellDesign()
    }
    
    private func setUpCellDesign() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "black")?.cgColor
        self.layer.cornerRadius = 5
    }
    
}
