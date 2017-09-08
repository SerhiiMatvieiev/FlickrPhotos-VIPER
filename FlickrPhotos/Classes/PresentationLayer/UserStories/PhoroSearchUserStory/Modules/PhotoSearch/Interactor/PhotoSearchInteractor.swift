//
//  PhotoSearchPhotoSearchInteractor.swift
//  FlickrPhotos
//
//  Created by cd Sergey Matveev on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

class PhotoSearchInteractor: PhotoSearchInteractorInput {

    weak var output: PhotoSearchInteractorOutput!
    
    var flickrPhotoService: FlickrPhotoService!
    
    func searchPhotos(withTag tag: String, page: Int) {
        flickrPhotoService.searchPhotos(withTag: tag, page: page) { (photos, totalPages, error) in
            
            if let error = error {
                self.output.didOccurError(error)
                return
            }
            
            self.output.didSearchPhotos(photos: photos, totalPages: totalPages)
        }
    }

}
