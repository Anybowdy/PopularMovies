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
    
    // MARK: - Outlets
    
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlurEffectView()
        setUpDetailsView()
        addTapGestureRecognizer()
        view.backgroundColor = UIColor.clear
    }
    
    // MARK: - UI
    
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
