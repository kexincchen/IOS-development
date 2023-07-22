//
//  UserDefaultManager.swift
//  ios-development-cpu
//
//  Created by Clare C on 22/7/2023.
//

import Foundation
import UIKit


class UserDefaultManager {
    let store = UserDefaults.standard
    
    static private let photosKey: String = "PHOTOSNAME"
    
    func addPhoto(image: String){
        var photos = getPhotos() ?? []
        photos.append(image)
        store.setValue(photos, forKey: UserDefaultManager.photosKey)
    }
    
    func getPhotos() -> [String]?{
        store.array(forKey: UserDefaultManager.photosKey) as? [String]
    }
    
    func removePhoto(index: Int){
        var photos = getPhotos() ?? []
        if photos == [] {
            return
        }
        
        photos.remove(at: index)
        store.setValue(photos, forKey: UserDefaultManager.photosKey)
    }
    
}
