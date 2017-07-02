//
//  LoadPhotoService.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

typealias PhotosLoaderCompletion = (Photo, Error?) -> ()

import Foundation

protocol PhotoLoaderService {
    
    /**
     @author Serhii Matvieiev
     
     Method is used to load photo by sending request to server
     
     @param url Photo url
     
     @param completion called upon completion the method, and returns Error if there is any
     */
    func loadPhoto(withURL url: URL, completion: PhotosLoaderCompletion)
}
