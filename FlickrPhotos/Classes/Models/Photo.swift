//
//  Photo.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit
import ObjectMapper

class Photo: Mappable {
    
    var photoID: String?
    var farmID: Int?
    var serverID: String?
    var secret: String?
    var title: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        photoID <- map["id"]
        farmID <- map["farm"]
        serverID <- map["server"]
        secret <- map["secret"]
        title <- map["title"]
    }
    
    var photoURL: URL? {
        return photoURL()
    }
    
    var largePhotoURL: URL? {
        return photoURL(PhotoSize.large)
    }
    
    // MARK: - Private implementations
    
    // example: https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
    
    private func photoURL(_ size: String = PhotoSize.small) -> URL? {
        guard let farmID = farmID,
            let serverID = serverID,
            let photoID = photoID,
            let secret = secret
            
            else {
                return nil
        }
        return URL(string: "https://farm\(farmID).staticflickr.com/\(serverID)/\(photoID)_\(secret)_\(size).jpg")
    }
    
    private struct PhotoSize {
        static let small = "m"
        static let large = "b"
    }
}
