//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct HashTagItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var category: Category
    var tagType: TagType
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case people = "people"
        case location = "location"
        case item = "item"
        case lifeStyle = "lifestyle"
        case lifeStage = "lifestage"
        var color: Color {
            switch self {
            case .people:
                return .purple
            case .location:
                return .yellow
            case .item:
                return .pink
            case .lifeStyle:
                return .orange
            case .lifeStage:
                return .green
            }
        }
        var icon: String {
            switch self {
            case .people:
                return "person.2"
            case .location:
                return "location.circle"
            case .item:
                return "briefcase"
            case .lifeStyle:
                return "heart"
            case .lifeStage:
                return "person.3"
            }
        }
    }
    
    enum TagType: String, CaseIterable, Codable, Hashable {
        case yourlocation = "near your current location"
        case yourhome = "near your home"
        case yourdestination = "near your destination"
        case category = "category"
        case trendy = "trendy"
        case outdoor = "outdoor"
        case sporty = "sporty"
        case healthy = "healthy"
        case cooltech = "cool tech"
        case trend = "trending now"
        case hobby = "new passion"
        case professional = "true expert"
        case influential = "your stylist/influencer"
        case popular = "like a celebrity"
    }
}

extension HashTagItem {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
