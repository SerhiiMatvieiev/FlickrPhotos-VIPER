//
//  PhotoSearchPhotoSearchInteractor.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

class PhotoSearchInteractor: PhotoSearchInteractorInput {

    weak var output: PhotoSearchInteractorOutput!
        
    // Dummy data
    private let photos = [Photo(color: .red), Photo(color: .green), Photo(color: .blue)]

    func fetchPhotos(withName: String) {
        output.didFetchPhotos(photos: photos)
    }

}
