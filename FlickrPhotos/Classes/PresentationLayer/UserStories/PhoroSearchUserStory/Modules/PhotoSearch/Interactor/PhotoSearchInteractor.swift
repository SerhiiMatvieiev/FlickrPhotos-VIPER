//
//  PhotoSearchPhotoSearchInteractor.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

class PhotoSearchInteractor: PhotoSearchInteractorInput {

    weak var output: PhotoSearchInteractorOutput!
    
    var flickrPhotoService: FlickrPhotoService!
    
    func searchPhotos(withTag tag: String, page: Int) {
        flickrPhotoService.searchPhotos(withTag: tag, page: page) { [weak self] (photos, totalPages, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.output.didOccurError(error)
                return
            }
            
            strongSelf.output.didSearchPhotos(photos: photos, totalPages: totalPages)
        }
    }

}
