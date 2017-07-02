//
//  FlickrPhoto.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 7/2/17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit
import ObjectMapper

class FlickrPhoto: Mappable {

    var total: String?
    var photos: [Photo]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        total <- map["total"]
        photos <- map["photo"]
    }
}
