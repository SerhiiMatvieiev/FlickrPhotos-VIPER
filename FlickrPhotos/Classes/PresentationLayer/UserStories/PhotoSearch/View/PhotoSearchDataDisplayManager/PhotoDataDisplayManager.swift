//
//  DataDisplayManagerDelegate.swift
//  FlickrPhotos
//
//  Created Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManager: DataDisplayManager {
    func update(withPhotos photos: [PhotoVM], hasMore: Bool)
    func clearView()
}
