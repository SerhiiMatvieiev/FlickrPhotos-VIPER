//
//  DataDisplayManagerDelegate.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManager: DataDisplayManager {
        
    /**
     Update collectionView.
     */
    func updateCollectionView(withPhotos: [Photo], totalPages: Int)
    
    /**
     Clear collectionView.
     */
    func claerView()

    /**     
     Count of photo
     */
    var photoCount: Int { get }
    
}
