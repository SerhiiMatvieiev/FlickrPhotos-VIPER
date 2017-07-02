//
//  PhotoSearchPhotoSearchConfigurator.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PhotoSearchViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PhotoSearchViewController) {

        let router = PhotoSearchRouter()
        router.transitionHandler = viewController
        
        let presenter = PhotoSearchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PhotoSearchInteractor()
        interactor.output = presenter

        let dataDisplayManager = PhotoSearchDataImplementation()
        viewController.dataDisplayManager = dataDisplayManager
        
        let flickrPhotoService = FlickrPhotoServiceImplementation()
        interactor.flickrPhotoService = flickrPhotoService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
