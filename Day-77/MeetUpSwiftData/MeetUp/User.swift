//
//  Person.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class User {
    var name = "name"
    var bio = "description"
    @Attribute(.externalStorage) var photo: Data
    
    var inputImage: UIImage {
        if let image = UIImage(data: photo) {
            return image
        }else{
            return UIImage(resource: .person0)
        }
    }
    init(name: String = "name", bio: String = "description", photo: Data) {
        self.name = name
        self.bio = bio
        self.photo = photo
    }

}
