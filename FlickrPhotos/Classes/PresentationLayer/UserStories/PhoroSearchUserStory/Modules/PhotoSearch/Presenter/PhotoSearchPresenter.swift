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

    func viewIsReady() {
        interactor.fetchPhotos()
    }
    
    func didFetchPhotos(photos: [Photo]) {
        view.setupViewWithEventList(photos: photos)
    }
}
