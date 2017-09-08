//
//  PhotoSearchDetailPhotoSearchDetailViewInput.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDetailViewInput: class {

    /**
     Setup initial state of the view
    */
    func setupInitialState()
    
    /**     
     Show loaded image
     */
    func showImage(_ image: UIImage)
}
