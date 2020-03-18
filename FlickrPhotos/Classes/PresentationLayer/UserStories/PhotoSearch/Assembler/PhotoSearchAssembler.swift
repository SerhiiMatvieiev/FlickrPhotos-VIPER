//
//  PhotoSearchAssembler.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

enum PhotoSearchModuleAssembler {
    typealias ModuleInputConfigurator = (PhotoSearchModuleInput) -> Void
    static func makeModule(_ configurator: ModuleInputConfigurator? = nil) -> UIViewController {

        let view = PhotoSearchViewController()
        view.dataDisplayManager = PhotoSearchDataImplementation()

        let router = PhotoSearchRouter()
        router.view = view

        let presenter = PhotoSearchPresenter()
        presenter.view = view
        presenter.router = router

        let interactor = PhotoSearchInteractor()
        interactor.output = presenter
        interactor.flickrPhotoService = ServicesAssembler.standardFlickrPhotoService()

        presenter.interactor = interactor
        view.output = presenter

        
        configurator?(presenter)
	
        return view
    }

}
