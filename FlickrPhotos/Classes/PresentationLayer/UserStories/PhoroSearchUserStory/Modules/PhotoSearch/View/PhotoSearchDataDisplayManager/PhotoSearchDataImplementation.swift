//
//  PhotoSearchDataDisplayManager.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManagerDelegate: class {

    func didTapCell(withPhoto photo: Photo)

}

class PhotoSearchDataImplementation: NSObject, PhotoSearchDataDisplayManager {
    
    weak var delegate: PhotoSearchDataDisplayManagerDelegate!
    
    // MARK: - PhotoSearchDataDisplayManager
    
    func dataSource(for collectionView: UICollectionView) -> UICollectionViewDataSource {
        collectionView.registerCellNib(PhotoSearchCell.self)
        collectionView.registerCellNib(PhotoSearchLoadingCell.self)
        return self
    }

    func delegate(for collectionView: UICollectionView, withBaseDelegate delegate: PhotoSearchDataDisplayManagerDelegate) -> UICollectionViewDelegate {
        self.delegate = delegate
        return self
    }

    func updateCollectionView(withPhotos photos: [Photo]) {
        self.photos = photos
        print("updating collection view")
        print("")
    }
    
    fileprivate var photos: [Photo]!
}

// MARK: - UICollectionViewDataSource

extension PhotoSearchDataImplementation: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoSearchCell.reuseIdentifier, for: indexPath) as! PhotoSearchCell
        
        cell.photo = photos[indexPath.item]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PhotoSearchDataImplementation: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoSearchCell,
            let photo = cell.photo else { return }
        delegate.didTapCell(withPhoto: photo)
    }
}
