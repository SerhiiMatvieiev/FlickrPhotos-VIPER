//
//  PhotoSearchDetailPhotoSearchDetailInteractor.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailInteractor: PhotoSearchDetailInteractorInput {

    weak var output: PhotoSearchDetailInteractorOutput!
    
    var imageLoaderService: ImageLoaderService!

    // MARK: - PhotoSearchDetailInteractorInput
    
    func loadImage(withURL url: URL) {
        imageLoaderService.loadImage(withURL: url) { (image, error) in
                        
            if let error = error {
                self.output.didOccurError(error)
                return
            }
            
            self.output.didLoadImage(image!)
        }
    }
}
