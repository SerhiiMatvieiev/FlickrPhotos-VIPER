//
//  PhotoDetailViewController.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: Dependencies
    var output: PhotoDetailViewOutput!

    // MARK: Subviews
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Private
    private func setupUI() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - PhotoDetailViewInput
extension PhotoDetailViewController: PhotoDetailViewInput {
    func setupInitialState() {
        view.backgroundColor = .white
        setupUI()
    }
    func setupTitle(_ title: String?) {
        self.title = title
    }
    func showImage(_ image: UIImage) {
        imageView.image = image
    }
    func displayError(_ error: Error) {
        let alertController = UIAlertController(title: Alert.Title.error, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: Alert.Button.ok, style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    func showWaitingLoader() {
        activityIndicator.startAnimating()
    }
    func hideWaitingLoader() {
        activityIndicator.stopAnimating()
    }
}
