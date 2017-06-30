//
//  PhotoSearchPhotoSearchInteractorOutput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorOutput: class {

    func didFetchPhotos(photos: [Photo])
}
