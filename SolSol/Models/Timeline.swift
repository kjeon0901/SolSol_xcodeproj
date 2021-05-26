//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct Timeline: Hashable, Codable, Identifiable {
    var id: Int
    var userName: String
    fileprivate var profileImageName: String
    fileprivate var photoNames: [String]
    var description: String
    var hashtag: String
    var following: Bool
    var videoName: String
    var likes: Int
    var createDate: String
}

extension Timeline {
    var profileImage: Image {
        ImageStore.shared.image(name: profileImageName)
    }
}

extension Timeline {
    var photoImages: [Image] {
        var images = [Image]()
        for item in photoNames {
            images.append(ImageStore.shared.image(name: item))
        }
        return images
    }
}
