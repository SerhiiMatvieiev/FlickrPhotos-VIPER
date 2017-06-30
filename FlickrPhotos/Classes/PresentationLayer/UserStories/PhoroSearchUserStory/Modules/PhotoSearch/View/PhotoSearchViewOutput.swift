//
//  PhotoSearchPhotoSearchViewOutput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchViewOutput {

    /**
        @author Serhii Matvieiev
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    /**
     @author Serhii Matvieiev
     Obtain photos from FlickrAPI
     */
    
    func obrainPhotos(withName: String)
}
