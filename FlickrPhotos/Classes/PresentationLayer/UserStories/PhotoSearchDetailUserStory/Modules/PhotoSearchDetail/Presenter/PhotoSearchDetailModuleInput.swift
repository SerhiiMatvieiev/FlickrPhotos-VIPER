//
//  PhotoSearchDetailPhotoSearchDetailModuleInput.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

protocol PhotoSearchDetailModuleInput: class {

    /**
     @author Serhii Matvieiev
     
     Method is used to cunfigure photo search detail module
     
     @param photo Photo object
     */
    func configureCurrentModule(withPhoto photo: Photo)
}
