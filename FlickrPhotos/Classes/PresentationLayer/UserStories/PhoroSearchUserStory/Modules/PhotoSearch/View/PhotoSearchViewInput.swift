//
//  PhotoSearchPhotoSearchViewInput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchViewInput: class {

    /**
        @author Serhii Matvieiev
        Setup collectionView with photos
    */

    func setupViewWithEventList(photos: [Photo])
}
