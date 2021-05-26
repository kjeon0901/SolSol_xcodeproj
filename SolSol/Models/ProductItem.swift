//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ProductItem: Hashable, Codable, Identifiable {
    var id: Int
    var userName: String
    var userId: String
    fileprivate var profileImageName: String
    var tags: [String]
    var description: String
    var rentalPrice: Int
    var purchasePrice: Int
    var location: String
    var createDate: Date
    
    static let `default` = Self(101, userName: "chimchim", userId: "chim_418", profileImageName: "chimchim", tags: ["dress","vintage","chanel"], description: "", rentalPrice: 150, purchasePrice: 200, location: "")
    
    init(_ id: Int, userName: String, userId: String, profileImageName: String, tags: [String], description: String, rentalPrice: Int = 0, purchasePrice: Int = 0, location: String) {
        self.id = id
        self.userName = userName
        self.userId = userId
        self.profileImageName = profileImageName
        self.tags = tags
        self.description = description
        self.rentalPrice = rentalPrice
        self.purchasePrice = purchasePrice
        self.location = location
        self.createDate = Date()
    }
}

extension ProductItem {
    var profileImage: Image {
        ImageStore.shared.image(name: profileImageName)
    }
}
