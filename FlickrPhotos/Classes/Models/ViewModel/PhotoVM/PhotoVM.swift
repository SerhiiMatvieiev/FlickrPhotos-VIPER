//
//  PhotoViewModel.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 18.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

struct PhotoVM {
    let id: String?
    let farmID: Int?
    let serverID: String?
    let secret: String?
    let title: String?
    
    var photoURL: URL? {
        return photoURL()
    }
    
    var largePhotoURL: URL? {
        return photoURL(PhotoSize.large)
    }
    
    // MARK: - Private
    /// Url example: https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
    private func photoURL(_ size: String = PhotoSize.small) -> URL? {
        guard
            let farmID = farmID,
            let serverID = serverID,
            let id = id,
            let secret = secret
            else { return nil }
        return URL(string: "https://farm\(farmID).staticflickr.com/\(serverID)/\(id)_\(secret)_\(size).jpg")
    }
    
    private struct PhotoSize {
        static let small = "m"
        static let large = "b"
    }
}
