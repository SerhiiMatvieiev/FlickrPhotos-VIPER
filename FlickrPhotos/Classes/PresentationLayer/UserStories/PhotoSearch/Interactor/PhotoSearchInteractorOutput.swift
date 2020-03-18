//
//  PhotoSearchInteractorOutput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorOutput: class {
    func didObtainPhotos(photos: [Photo], totalPages: Int)
    func didOccurError(_ error: Error)
}
