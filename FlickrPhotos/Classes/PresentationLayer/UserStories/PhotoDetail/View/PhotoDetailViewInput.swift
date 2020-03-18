//
//  PhotoDetailViewInput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol PhotoDetailViewInput: class {
    func setupInitialState()
    func setupTitle(_ title: String?)
    func showImage(_ image: UIImage)
    func displayError(_ error: Error)
    func showWaitingLoader()
    func hideWaitingLoader()
}
