//
//  DataDisplayManager.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol DataDisplayManager {
    func dataSource(for collectionView: UICollectionView) -> UICollectionViewDataSource
    func delegate(for collectionView: UICollectionView, withBaseDelegate delegate: DataDisplayManagerDelegate) -> UICollectionViewDelegate
}

protocol DataDisplayManagerDelegate: class { }
