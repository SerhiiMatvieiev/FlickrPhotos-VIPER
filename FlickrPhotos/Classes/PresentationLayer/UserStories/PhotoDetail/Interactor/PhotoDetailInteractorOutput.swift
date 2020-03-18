//
//  PhotoDetailInteractorOutput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol PhotoDetailInteractorOutput: class {
    func didLoadImage(_ image: UIImage)
    func didOccurError(_ error: Error)
}
