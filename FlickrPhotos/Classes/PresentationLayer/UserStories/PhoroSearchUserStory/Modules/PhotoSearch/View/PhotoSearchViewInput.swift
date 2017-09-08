//
//  PhotoSearchPhotoSearchViewInput.swift
//  FlickrPhotos
//
//  Created by cd Sergey Matveev on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchViewInput: class {
    
    /**
     Update collectionView with photos
     */
    func setupView()

    /**
     Update collectionView with photos
    */
    func updateView(withPhotos photos: [Photo], totalPages: Int)
    
    /**
     Display error
     */
    func displayError(_ error: Error)
    
    /**
     Show waiting view
     */
    func showWaitingView()
    
    /**
     Hide waiting view
     */
    func hideWaitingView()
    
    /**     
     Photos count on view
     */
    var photosCount: Int { get }

}
