//
//  PhotoSearchInteractorInput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorInput {
    func searchPhotos(withTag tag: String, page: Int)
}
