//
//  Photo.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import Foundation

struct Photo {
    let id: String?
    let farmID: Int?
    let serverID: String?
    let secret: String?
    let title: String?
}

// MARK: - Decodable
extension Photo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        farmID = try? container.decode(Int.self, forKey: .farmID)
        serverID = try? container.decode(String.self, forKey: .serverID)
        secret = try? container.decode(String.self, forKey: .secret)
        title = try? container.decode(String.self, forKey: .title)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case farmID = "farm"
        case serverID = "server"
        case secret
        case title
    }
}

// MARK: - Equatable
extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id &&
            lhs.farmID == rhs.farmID &&
            lhs.serverID == rhs.serverID &&
            lhs.secret == rhs.secret &&
            lhs.title == rhs.title
    }
}
