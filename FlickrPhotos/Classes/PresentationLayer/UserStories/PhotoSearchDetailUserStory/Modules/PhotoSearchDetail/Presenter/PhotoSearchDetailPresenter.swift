//
//  PhotoSearchDetailPhotoSearchDetailPresenter.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailPresenter: NSObject, PhotoSearchDetailModuleInput, PhotoSearchDetailViewOutput, PhotoSearchDetailInteractorOutput {

    weak var view: PhotoSearchDetailViewInput!
    var interactor: PhotoSearchDetailInteractorInput!
    var router: PhotoSearchDetailRouterInput!

    var photo: Photo?
    
    func viewIsReady() {
        if let url = photo!.largePhotoURL {
            interactor.loadImage(withURL: url)
        } else {
            // TODO: Show error
        }
    }
    
    // MARK: - PhotoSearchDetailModuleInput
    
    func configureCurrentModule(withPhoto photo: Photo) {
        self.photo = photo
    }
    
    // MARK: - PhotoSearchDetailInteractorOutput

    func didLoadImage(_ image: UIImage) {
        view.showImage(image)
    }
    
    func didOccurError(_ error: Error) {
        
    }
}
