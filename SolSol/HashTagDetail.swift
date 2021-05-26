//
//  HashTagDetail.swift
//  SolSol
//
//  Created by chopper on 2020/04/05.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct HashTagDetail: View {
    var category: HashTagItem.Category
    
    var categories: [String: [HashTagItem]] {
        Dictionary(
            grouping: hashTagData.filter {
                $0.category == self.category
            },
            by: {$0.tagType.rawValue}
        )
    }
    var body: some View {
        return VStack {
            ForEach(Array(categories.keys), id: \.self) { key in
                CategoryRow(tagTypeName: key, items: self.categories[key]!)
            }
        }
    }
}

struct HashTagDetail_Previews: PreviewProvider {
    static var previews: some View {
        HashTagDetail(category: HashTagItem.Category.people)
        .environmentObject(UserData())
    }
}
