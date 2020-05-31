//
//  MovieDetailsView.swift
//  PopularMovies
//
//  Created by Joseph Huang on 31/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Title Of Popup"
        label.textColor = UIColor.white
        return label
    }()
    
    let detailsContainer: UIView = {
        let detailsView = UIView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.backgroundColor = .white
        detailsView.layer.cornerRadius = 20
        return detailsView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "white")
        //self.addSubview(detailsContainer)
        //self.addSubview(label)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor(named: "white")
    }
    
    
}
