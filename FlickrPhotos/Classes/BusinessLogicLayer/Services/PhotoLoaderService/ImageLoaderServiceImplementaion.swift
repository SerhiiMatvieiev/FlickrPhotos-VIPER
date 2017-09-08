//
//  LoadPhotoServiceImplementaion.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation
import SDWebImage

class ImageLoaderServiceImplementaion: ImageLoaderService {

    func loadImage(withURL url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        SDWebImageManager.shared().downloadImage(with: url, progress: nil) { (image, error, cache, isFinished, url) in
            
            if error != nil {
                completion(nil, error)
                return
            }

            if let image = image, isFinished {
                completion(image, nil)
            }
        }
    }
    
}
