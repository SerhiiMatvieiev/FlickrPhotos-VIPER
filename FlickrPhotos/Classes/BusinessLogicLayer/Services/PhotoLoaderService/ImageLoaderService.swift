//
//  LoadPhotoService.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

typealias ImagesLoaderCompletion = (UIImage?, Error?) -> ()

protocol ImageLoaderService {
    
    /**     
     Method is used to load photo by sending request to server
     
     @param url Photo url
     
     @param completion called upon completion the method, and returns Error if there is any
     */
    func loadImage(withURL url: URL,
                   completion: @escaping ImagesLoaderCompletion)
}
