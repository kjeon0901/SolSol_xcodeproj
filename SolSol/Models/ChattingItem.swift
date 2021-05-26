//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ChattingItem: Hashable, Codable, Identifiable {
    var id: Int
    var chatName: String
    fileprivate var chattingRoomImageName: String
    var lastMessage: String
    var lastDate: Date
    var unread: Bool
}

extension ChattingItem {
    var chattingRoomImage: Image {
        ImageStore.shared.image(name: chattingRoomImageName)
    }
}
