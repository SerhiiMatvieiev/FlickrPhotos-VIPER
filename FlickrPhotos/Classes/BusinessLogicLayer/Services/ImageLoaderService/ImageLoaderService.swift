//
//  LoadPhotoService.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 7/2/17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

typealias ImagesLoaderCompletion = (Result<UIImage, Error>) -> Void

protocol ImageLoaderService {
    func loadImage(withURL url: URL, completion: @escaping ImagesLoaderCompletion)
}
