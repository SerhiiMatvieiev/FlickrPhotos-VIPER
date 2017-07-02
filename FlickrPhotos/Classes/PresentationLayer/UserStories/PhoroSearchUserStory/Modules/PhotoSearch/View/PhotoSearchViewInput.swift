//
//  PhotoSearchPhotoSearchViewInput.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchViewInput: class {
    
    /**
     @author Serhii Matvieiev
     
     Update collectionView with photos
     */
    func setupView()

    /**
     @author Serhii Matvieiev
     
     Update collectionView with photos
    */
    func updateView(withPhotos photos: [Photo], totalPages: Int)
    
    /**
     @author Serhii Matvieiev
     
     Display error
     */
    func displayError(_ error: Error)
    
    /**
     @author Serhii Matvieiev
     
     Show waiting view
     */
    func showWaitingView()
    
    /**
     @author Serhii Matvieiev
     
     Hide waiting view
     */
    func hideWaitingView()
    
    /**
     @author Serhii Matvieiev
     
     Photos count on view
     */
    var photosCount: Int { get }

}
