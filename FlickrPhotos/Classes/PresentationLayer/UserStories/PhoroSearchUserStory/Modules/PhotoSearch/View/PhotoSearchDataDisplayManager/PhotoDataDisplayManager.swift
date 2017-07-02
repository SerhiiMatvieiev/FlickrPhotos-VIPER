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
     @author Serhii Matvieiew
     
     Update collectionView.
     */
    func updateCollectionView(withPhotos: [Photo], totalPages: Int)
    
    /**
     @author Serhii Matvieiew
     
     Clear collectionView.
     */
    func claerView()

    /**
     @author Serhii Matvieiew
     
     Count of photo
     */
    var photoCount: Int { get }
    
}
