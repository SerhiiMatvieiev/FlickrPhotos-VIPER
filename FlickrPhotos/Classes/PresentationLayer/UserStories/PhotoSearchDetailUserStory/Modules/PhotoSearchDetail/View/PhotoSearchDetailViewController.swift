//
//  PhotoSearchDetailPhotoSearchDetailViewController.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailViewController: UIViewController, PhotoSearchDetailViewInput {

    var output: PhotoSearchDetailViewOutput!

    @IBOutlet weak var flickrImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        output.viewIsReady()
    }

    // MARK: PhotoSearchDetailViewInput
    
    func setupInitialState() {
        flickrImageView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func showImage(_ image: UIImage) {
        flickrImageView.image = image
        flickrImageView.isHidden = false
        activityIndicator.stopAnimating()
    }
}
