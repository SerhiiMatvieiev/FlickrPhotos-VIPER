//
//  PhotoSearchRouter.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

class PhotoSearchRouter: Router {

    // MARK: Dependencies
    weak var view: PhotoSearchViewInput?
}

// MARK: - PhotoSearchRouterInput
extension PhotoSearchRouter: PhotoSearchRouterInput {
    func openPhotoDetail(withPhoto photo: Photo) {
        let photoDetailModule = PhotoDetailModuleAssembler.makeModule {
            $0.photo = photo
        }
        navigationController?.pushViewController(photoDetailModule, animated: true)
    }
}
