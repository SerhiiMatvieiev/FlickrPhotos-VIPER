//
//  PhotoDetailInteractor.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

class PhotoDetailInteractor {

    // MARK: Dependencies
    weak var output: PhotoDetailInteractorOutput?
    var imageLoaderService: ImageLoaderService!
}

// MARK: - PhotoDetailInteractorInput
extension PhotoDetailInteractor: PhotoDetailInteractorInput {
    func loadImage(withURL url: URL) {
        imageLoaderService.loadImage(withURL: url) { result in
            switch result {
            case .success(let image):
                self.output?.didLoadImage(image)
            case .failure(let error):
                self.output?.didOccurError(error)
            }
        }
    }
}
