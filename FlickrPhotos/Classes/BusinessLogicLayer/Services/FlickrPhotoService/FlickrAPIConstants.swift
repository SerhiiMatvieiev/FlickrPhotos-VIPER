//
//  FlickrAPIConstants.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

struct FlickrAPI {
    static let key = "4962d4029479b365ad7c1565681c8704"
    static let baseURL = "https://api.flickr.com"
    static let keyPath = "photos"
    
    struct Endpoint {
        static let searchPhoto = "/services/rest/"
    }
}
