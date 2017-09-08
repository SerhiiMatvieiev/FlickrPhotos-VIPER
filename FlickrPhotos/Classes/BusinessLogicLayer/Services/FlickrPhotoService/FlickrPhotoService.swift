//
//  FlickrPhotoService.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

typealias FlickrPhotosCompletion = ([Photo], Int, Error?) -> ()

protocol FlickrPhotoService {
    
    /**     
     Method is used to find a Flickr photos by sending request to server
     
     @param tag is photo tag
     
     @param page it is page number
     
     @param completion called upon completion the method, and returns Error if there is any
    */
    func searchPhotos(withTag tag: String,
                      page: Int,
                      completion: @escaping FlickrPhotosCompletion)

}
