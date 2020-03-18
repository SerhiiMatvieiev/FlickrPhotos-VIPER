//
//  Collection.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 19.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
