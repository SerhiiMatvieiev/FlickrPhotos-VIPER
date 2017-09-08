//
//  PhotoSearchPhotoSearchViewOutput.swift
//  FlickrPhotos
//
//  Created by cd Sergey Matveev on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchViewOutput {

    /**
     Notify presenter that view is ready
    */
    func viewIsReady()
    
    /**     
     Obtain photos from FlickrAPI
     */
    func searchPhotos(withTag tag: String, page: Int)

    
    func didTriggerTapCell(withPhoto photo: Photo)

}
