//
//  PhotoSearchDetailPhotoSearchDetailInteractorInput.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation

protocol PhotoSearchDetailInteractorInput {

    /**     
     Method is used to load image by sending request to server
     
     @param url Image url
     */
    func loadImage(withURL url: URL)
}
