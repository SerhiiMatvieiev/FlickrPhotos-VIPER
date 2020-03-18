//
//  FlickrPhoto+VM.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 19.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

// MARK: ViewModelConvertible
extension FlickrPhoto: ViewModelConvertible {
    func asViewModel() -> FlickrPhotoVM {
        return FlickrPhotoVM(total: total,
                             photos: photos.mapToViewModel())
    }
}
