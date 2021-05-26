//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct UserProfile: Hashable, Codable, Identifiable {
    var id: Int
    var userName: String
    var userId: String
    var membership: MembershipType
    fileprivate var profileImageName: String
    var description: String
    var anticipatedRevenue: Double
    var myItems: [MyItem]
    var follower: Int
    var following: Int
    var beforeDeposit: Int
    var preparing: Int
    var shipping: Int
    var delivered: Int
    enum MembershipType: String, CaseIterable, Codable, Hashable {
        case platinum = "platinum"
        case gold = "gold"
        case silver = "silver"
        case bronze = "bronze"
    }
}

extension UserProfile {
    var profileImage: Image {
        ImageStore.shared.image(name: profileImageName)
    }
}

struct MyItem: Hashable, Codable, Identifiable {
    var id: Int
    fileprivate var photoName: String
    var status: ItemStatus
    
    enum ItemStatus: String, CaseIterable, Codable, Hashable {
        case none = "none"
        case renting = "renting"
        case sold = "sold"
    }
}

extension MyItem {
    var photoImage: Image {
        ImageStore.shared.image(name: photoName)
    }
}
