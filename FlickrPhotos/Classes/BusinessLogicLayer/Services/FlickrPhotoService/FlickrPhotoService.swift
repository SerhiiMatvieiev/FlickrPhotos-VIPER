//
//  FlickrPhotoService.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 7/2/17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

typealias FlickrPhotosCompletion = (Result<FlickrPhoto, Error>) -> Void

protocol FlickrPhotoService {
    func searchPhotos(withTag tag: String, page: Int, completion: @escaping FlickrPhotosCompletion)
}
