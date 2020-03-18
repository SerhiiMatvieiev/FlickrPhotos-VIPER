//
//  FlickrPhotoServiceImplementation.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 7/2/17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import Foundation
import Alamofire

class FlickrPhotoServiceImpl {
    
    // MARK: Private
    private func parameters(withTag tag: String, page: Int) -> [String: Any] {
        return ["method"        : "flickr.photos.search",
                "api_key"       : FlickrAPIConstants.key,
                "tags"          : tag,
                "page"          : page,
                "format"        : "json",
                "nojsoncallback": 1]
    }
}

// MARK: - FlickrPhotoService
extension FlickrPhotoServiceImpl: FlickrPhotoService {
    func searchPhotos(withTag tag: String, page: Int, completion: @escaping FlickrPhotosCompletion) {
        let urlString = FlickrAPIConstants.baseURL + FlickrAPIConstants.Endpoint.searchPhoto
        
        AF.request(urlString, method: .get, parameters: parameters(withTag: tag, page: page)).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let flickrPhoto = try JSONDecoder().decode(FlickrPhoto.self, from: data)
                    completion(.success(flickrPhoto))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }        
    }
}

