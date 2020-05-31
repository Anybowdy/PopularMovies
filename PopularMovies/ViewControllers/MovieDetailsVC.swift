//
//  MovieDetailsVC.swift
//  PopularMovies
//
//  Created by Joseph Huang on 31/05/2020.
//  Copyright © 2020 Joseph Huang. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsVC: UIViewController {
    
    let apiImageUrl = "https://image.tmdb.org/t/p/w200/"
    var movie: Movie? = nil
    
    // MARK: - Outlets
    
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var movieCover: UIImageView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatchInformation(movie: movie!)
        addBlurEffectView()
        setUpDetailsView()
        addTapGestureRecognizer()
        view.backgroundColor = UIColor.clear
    }
    
    // MARK: - UI
    
    func dispatchInformation(movie: Movie) {
        setUpMovieCoverImage(url: movie.backdrop_path)
    }
    
    func setUpMovieCoverImage(url: String?) {
        guard let movieCoverUrl = url else { return }
        guard let url = URL(string: self.apiImageUrl + movieCoverUrl) else { return }
        do {
            let movieImageData = try Data(contentsOf: url)
            self.movieCover.image = UIImage(data: movieImageData)
        } catch let err{
            print(err)
        }
    }
    
    private func addBlurEffectView() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredView.backgroundColor = UIColor.clear
        blurredView.addSubview(blurEffectView)
    }
    
    private func setUpDetailsView() {
        detailsView.backgroundColor = .white
        detailsView.layer.cornerRadius = 12
        self.detailsView.clipsToBounds = true
    }
    
    // MARK: - Gesture recognizer
    
    private func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        blurredView.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    
    @objc func didTap(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }

}
