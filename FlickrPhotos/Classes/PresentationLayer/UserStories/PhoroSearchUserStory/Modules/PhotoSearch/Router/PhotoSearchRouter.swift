//
//  PhotoSearchPhotoSearchRouter.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import LightRoute

let showPhotoDetail = "ShowPhotoDetail"

class PhotoSearchRouter: PhotoSearchRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openPhotoSearchDetailModule(withPhoto photo: Photo) {
        transitionHandler.forSegue(identifier: showPhotoDetail,
                                   to: PhotoSearchDetailModuleInput.self) { (moduleInput) in
            moduleInput.configureCurrentModule(withPhoto: photo)
        }
    }
}
