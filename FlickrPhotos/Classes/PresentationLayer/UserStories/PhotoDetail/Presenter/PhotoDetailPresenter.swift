//
//  PhotoDetailPresenter.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

class PhotoDetailPresenter {

    // MARK: Dependencies
    weak var view: PhotoDetailViewInput?
    var interactor: PhotoDetailInteractorInput!
    var router: PhotoDetailRouterInput!
    
    var photo: Photo!
    
    // MARK: Private
    private var photoVM: PhotoVM {
        return photo.asViewModel()
    }
    
    private func loadImage() {
        guard let url = photoVM.largePhotoURL else {
            view?.hideWaitingLoader()
            view?.displayError(CommonError.somethingWentWrong)
            return
        }
        interactor.loadImage(withURL: url)
    }
}

// MARK: - PhotoDetailModuleInput
extension PhotoDetailPresenter: PhotoDetailModuleInput {

}

// MARK: - PhotoDetail ViewOutput
extension PhotoDetailPresenter: PhotoDetailViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
        view?.setupTitle(photoVM.title)
        view?.showWaitingLoader()
        loadImage()
    }
}

// MARK: - PhotoDetail InteractorOutput
extension PhotoDetailPresenter: PhotoDetailInteractorOutput {
    func didLoadImage(_ image: UIImage) {
        view?.hideWaitingLoader()
        view?.showImage(image)
    }
    func didOccurError(_ error: Error) {
        view?.hideWaitingLoader()
        view?.displayError(error)
    }
}
