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
    
    @IBOutlet weak var blurredView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlurEffectView()
        view.backgroundColor = UIColor.clear
        
    }
    
    func addBlurEffectView() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredView.backgroundColor = UIColor.clear
        blurredView.addSubview(blurEffectView)
    }
    
    @IBAction func onGoBackTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
