//
//  MoviesVC.swift
//  PopularMovies
//
//  Created by Joseph Huang on 30/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {

    var movies = ["1", "2", "3", "4", "5", "6"]
    
    // MARK: - Outlets

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        self.navigationItem.title = "POPULAR MOVIES 🍿🎬"
    }
    
    // MARK: - Navigation setup

}

// MARK: - UICollectionViewDelegate/Datasource

extension MoviesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCell
        return cell
    }
    
}

extension MoviesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (moviesCollectionView.frame.width / 2) - 10, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 5, bottom: 7, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
