//
//  PhotoSearchDetailPhotoSearchDetailPresenter.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import Foundation

class PhotoSearchDetailPresenter: NSObject, PhotoSearchDetailModuleInput, PhotoSearchDetailViewOutput, PhotoSearchDetailInteractorOutput {

    weak var view: PhotoSearchDetailViewInput!
    var interactor: PhotoSearchDetailInteractorInput!
    var router: PhotoSearchDetailRouterInput!

    var photo: Photo?
    
    func viewIsReady() {
        print("view is ready")
    }
    
    // MARK: - PhotoSearchDetailModuleInput
    
    func configureCurrentModule(withPhoto photo: Photo) {
        self.photo = photo
    }
}
