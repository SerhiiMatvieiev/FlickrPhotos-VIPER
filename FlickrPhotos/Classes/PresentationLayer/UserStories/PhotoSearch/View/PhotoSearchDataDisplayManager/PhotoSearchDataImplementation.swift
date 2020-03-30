//
//  PhotoSearchDataDisplayManager.swift
//  FlickrPhotos
//
//  Created Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManagerDelegate: DataDisplayManagerDelegate {
    func didSelectPhoto(at index: Int)
    func loadMore()
}

class PhotoSearchDataImplementation: NSObject {
    
    // MARK: Dependencies
    weak var delegate: PhotoSearchDataDisplayManagerDelegate!
    private weak var collectionView: UICollectionView!
    
    // MARK: Private
    private var hasMore = false
    private var photos: [PhotoVM] = []
}

// MARK: - PhotoSearchDataDisplayManager
extension PhotoSearchDataImplementation: PhotoSearchDataDisplayManager {
    func dataSource(for collectionView: UICollectionView) -> UICollectionViewDataSource {
        self.collectionView = collectionView
        collectionView.registerCell(PhotoSearchCell.self)
        collectionView.registerCell(PhotoLoadingCell.self)
        return self
    }
    func delegate(for collectionView: UICollectionView, withBaseDelegate delegate: DataDisplayManagerDelegate) -> UICollectionViewDelegate {
        self.delegate = delegate as? PhotoSearchDataDisplayManagerDelegate
        return self
    }
    func update(withPhotos photos: [PhotoVM], hasMore: Bool) {
        self.photos.append(contentsOf: photos)
        self.hasMore = hasMore
        collectionView.reloadData()
    }
    func clearView() {
        hasMore = false
        photos.removeAll()
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoSearchDataImplementation: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hasMore ? photos.count + 1 : photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < photos.count {
            return photoCell(collectionView, cellForItemAt: indexPath)
        } else {
            delegate?.loadMore()
            return loadingCell(collectionView, cellForItemAt: indexPath)
        }
    }
    func photoCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoSearchCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(withPhoto: photos[indexPath.item])
        return cell
    }
    func loadingCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoLoadingCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PhotoSearchDataImplementation: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelectPhoto(at: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoSearchDataImplementation: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < photos.count {
            let size = (collectionView.bounds.width / 3) - 2
            return CGSize(width: size, height: size)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 100)
        }
    }
}
