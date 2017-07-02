//
//  PhotoSearchPhotoSearchPresenter.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

class PhotoSearchPresenter: PhotoSearchModuleInput, PhotoSearchViewOutput, PhotoSearchInteractorOutput {

    weak var view: PhotoSearchViewInput!
    var interactor: PhotoSearchInteractorInput!
    var router: PhotoSearchRouterInput!

    // MARK: - PhotoSearchViewOutput
    
    func viewIsReady() {
        view.setupView()
    }
    
    func searchPhotos(withTag tag: String, page: Int) {
        
        if view.photosCount == 0 {
            view.showWaitingView()
        }
        
        interactor.searchPhotos(withTag: tag, page: page)
    }
    
    func didTriggerTapCell(withPhoto photo: Photo) {
        router.openPhotoSearchDetailModule(withPhoto: photo)
    }
    
    // MARK: - PhotoSearchInteractorOutput
    
    func didSearchPhotos(photos: [Photo], totalPages: Int) {
        view.hideWaitingView()
        view.updateView(withPhotos: photos, totalPages: totalPages)
    }
    
    func didOccurError(_ error: Error) {
        view.displayError(error)
    }

}
