//
//  PhotoSearchPhotoSearchInteractorInput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorInput {

    /**
     @author Serhii Matvieiev
     
     Method is used to search photos in Flickr
     
     @param tag is photo tag
     
     @param page it is page number
     */
    func searchPhotos(withTag tag: String,  page: Int)
}
