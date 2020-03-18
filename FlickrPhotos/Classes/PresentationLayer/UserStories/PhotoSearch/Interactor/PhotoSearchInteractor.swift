//
//  PhotoSearchInteractor.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

class PhotoSearchInteractor {

    // MARK: Dependencies
    weak var output: PhotoSearchInteractorOutput?
    var flickrPhotoService: FlickrPhotoService!
}

// MARK: - PhotoSearchInteractorInput
extension PhotoSearchInteractor: PhotoSearchInteractorInput {
    func searchPhotos(withTag tag: String, page: Int) {
        flickrPhotoService.searchPhotos(withTag: tag, page: page) { result in
            switch result {
            case .success(let flicrPhoto):
                self.output?.didObtainPhotos(photos: flicrPhoto.photos, totalPages: flicrPhoto.total)
            case .failure(let error):
                self.output?.didOccurError(error)
            }
        }
    }
}
