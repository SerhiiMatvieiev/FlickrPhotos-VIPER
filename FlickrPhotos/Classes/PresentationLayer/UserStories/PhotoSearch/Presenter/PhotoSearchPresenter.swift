//
//  PhotoSearchPresenter.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

class PhotoSearchPresenter {

    // MARK: Dependencies
    weak var view: PhotoSearchViewInput?
    var interactor: PhotoSearchInteractorInput!
    var router: PhotoSearchRouterInput!
    
    // MARK: Private
    private var searchTag = ""
    private var currentPage = 1
    private var totalPages = 1
    private var photos: [Photo] = []
}

// MARK: - PhotoSearchModuleInput
extension PhotoSearchPresenter: PhotoSearchModuleInput {

}

// MARK: - PhotoSearch ViewOutput
extension PhotoSearchPresenter: PhotoSearchViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    func search(tag: String) {
        searchTag = tag
        view?.showWaitingLoader()
        interactor.searchPhotos(withTag: tag, page: currentPage)
    }
    func openPhoto(at index: Int) {
        guard let photo = photos[safe: index] else {
            view?.displayError(CommonError.somethingWentWrong)
            return
        }
        router.openPhotoDetail(withPhoto: photo)
    }
    func loadMorePhotos() {
        currentPage += 1
        interactor.searchPhotos(withTag: searchTag, page: currentPage)
    }
}

// MARK: - PhotoSearch InteractorOutput
extension PhotoSearchPresenter: PhotoSearchInteractorOutput {
    func didObtainPhotos(photos: [Photo], totalPages: Int) {
        self.photos = photos
        self.totalPages = totalPages
        view?.hideWaitingLoader()
        view?.updateView(withPhotos: photos.mapToViewModel(), hasMore: currentPage < totalPages)
    }
    func didOccurError(_ error: Error) {
        view?.hideWaitingLoader()
        view?.displayError(error)
    }
}
