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
    var genres: [String] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var movieCover: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMovieCoverImage()
        setUpTitle()
        setUpGenre()
        setUpReleaseDate()
        setUpRate()
        setUpDescription()
        addBlurEffectView()
        setUpDetailsView()
        addTapGestureRecognizer()
        view.backgroundColor = UIColor.clear
    }
    
    // MARK: - UI
    
    func setUpTitle() {
        self.movieTitle.text = movie?.title
    }
    
    func setUpRate() {
        self.rate.text =  String(format: "%.1f", (movie!.vote_average / 2))
        self.rate.textColor = UIColor.white
    }
    
    func setUpGenre() {
        var res = ""
        for genre in genres {
            res.append(genre + " ")
        }
        self.genre.text = res
    }
    
    func setUpDescription() {
        self.movieDescription.text = movie?.overview
        self.movieDescription.textColor = UIColor.gray
    }
    
    func setUpReleaseDate() {
        self.releaseDate.text = movie?.release_date
    }
    
    func setUpMovieCoverImage() {
        guard let movieCoverUrl = movie?.backdrop_path else { return }
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
