//
//  PhotoSearchViewOutput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

protocol PhotoSearchViewOutput {
    func viewIsReady()
    func search(tag: String)
    func openPhoto(at index: Int)
    func loadMorePhotos()
}
