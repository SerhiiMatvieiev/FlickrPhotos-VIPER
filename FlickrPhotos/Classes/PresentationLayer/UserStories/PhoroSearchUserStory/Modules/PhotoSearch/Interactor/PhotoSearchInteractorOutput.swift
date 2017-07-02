//
//  PhotoSearchPhotoSearchInteractorOutput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorOutput: class {

    /**
     @author Serhii Matvieiev
     
     Method is used to inform presenter about new photos
     
     @param photos is array of Photo object
     */
    func didSearchPhotos(photos: [Photo], totalPages: Int)
    
    /**
     @author Serhii Matvieiev
     
     Method is used to inform presenter that occure error
     
     @param error error
     */
    func didOccurError(_ error: Error)
}
