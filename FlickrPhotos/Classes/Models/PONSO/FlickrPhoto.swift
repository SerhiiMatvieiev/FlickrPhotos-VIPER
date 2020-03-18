//
//  FlickrPhoto.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 7/2/17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import Foundation

struct FlickrPhoto {
    let total: Int
    let photos: [Photo]
}

// MARK: - Decodable
extension FlickrPhoto: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
        total = Int(try nestedContainer.decode(String.self, forKey: .total)) ?? 1
        photos = try nestedContainer.decode([Photo].self, forKey: .photo)
    }
    
    private enum CodingKeys: String, CodingKey {
        case photos
        case total
        case photo
    }
}

// MARK: - Equatable
extension FlickrPhoto: Equatable {
    static func == (lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool {
        return lhs.total == rhs.total &&
            lhs.photos == rhs.photos
    }
}
