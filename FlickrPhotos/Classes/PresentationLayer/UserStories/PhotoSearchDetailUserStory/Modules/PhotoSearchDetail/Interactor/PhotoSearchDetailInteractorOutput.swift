//
//  PhotoSearchDetailPhotoSearchDetailInteractorOutput.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDetailInteractorOutput: class {

    /**
     Method is used to inform presenter about loaded image
     
     @param image UIImage object
     */
    func didLoadImage(_ image: UIImage)
    
    /**     
     Method is used to inform presenter that occure error
     
     @param error Error
     */
    func didOccurError(_ error: Error)
}
