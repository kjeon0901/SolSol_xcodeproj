//
//  PopularHashTag.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct NotificationItem: Hashable, Codable, Identifiable {
    var id: Int
    var userId: String
    var userName: String
    var message: String
    var createDate: Date
}
