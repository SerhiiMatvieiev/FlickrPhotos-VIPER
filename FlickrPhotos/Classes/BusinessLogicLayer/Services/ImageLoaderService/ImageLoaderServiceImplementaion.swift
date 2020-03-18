//
//  LoadPhotoServiceImplementaion.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 7/2/17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit
import Kingfisher

struct ImageLoaderServiceImpl {
    
}

// MARK: - ImageLoaderService
extension ImageLoaderServiceImpl: ImageLoaderService {
    func loadImage(withURL url: URL, completion: @escaping ImagesLoaderCompletion) {
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let imageResult):
                completion(.success(imageResult.image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
