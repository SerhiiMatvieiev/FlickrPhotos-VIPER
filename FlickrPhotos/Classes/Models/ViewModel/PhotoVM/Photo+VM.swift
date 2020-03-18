//
//  Photo+VM.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 19.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import Foundation

// MARK: ViewModelConvertible
extension Photo: ViewModelConvertible {
    func asViewModel() -> PhotoVM {
        return PhotoVM(id: id,
                       farmID: farmID,
                       serverID: serverID,
                       secret: secret,
                       title: title)
    }
}
