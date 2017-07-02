//
//  FlickrPhotoServiceImplementation.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class FlickrPhotoServiceImplementation: FlickrPhotoService {
    
    func searchPhotos(withTag tag: String, page: Int, completion: @escaping FlickrPhotosCompletion) {
        
        let params: [String: Any] = ["method"        : "flickr.photos.search",
                                     "api_key"       : FlickrAPI.key,
                                     "tags"          : tag,
                                     "page"          : page,
                                     "format"        : "json",
                                     "nojsoncallback": 1]
        
        let urlString = FlickrAPI.baseURL + FlickrAPI.Endpoint.searchPhoto
        
        Alamofire.request(urlString, method: .get, parameters: params).responseObject(keyPath: FlickrAPI.keyPath) { (response: DataResponse<FlickrPhoto>) in
            
            if let error = response.result.error {
                print("Error search photos: \(error.localizedDescription)")
                completion([], 0, error)
                return
            }
            
            if let flickrPhoto = response.result.value {
                completion(flickrPhoto.photos!, Int(flickrPhoto.total!)!, nil)
                return
            }
            
            completion([], 0, nil)
            
        }
        
    }
}
