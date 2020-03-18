//
//  ServicesAssembler.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 18.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

enum ServicesAssembler {
    static func standardFlickrPhotoService() -> FlickrPhotoService {
        return FlickrPhotoServiceImpl()
    }
    static func standardImageLoaderService() -> ImageLoaderService {
        return ImageLoaderServiceImpl()
    }
}
