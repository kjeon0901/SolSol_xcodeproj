//
//  CategoryRow.swift
//  SolSol
//
//  Created by chopper on 2020/04/03.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var tagTypeName: String
    var items: [HashTagItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(tagTypeName.capitalized)
                .font(.headline)
                .bold()
                .padding(.leading, 16)
                .padding(.top, 8)
                .padding(.bottom, 0)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { item in
                        NavigationLink(destination: TimelineList(title: item.name)) {
                            CategoryItem(hashtag: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .frame(height: 108)
        }
    }
}

struct CategoryItem: View {
    var hashtag: HashTagItem
    var body: some View {
        ZStack(alignment: .bottom) {
            hashtag.image
                .resizable()
                .cornerRadius(8)
                .frame(width: 96, height: 96)
                .overlay(HashTagOverlay(overlayText: "#\(hashtag.name)"))
        }
        .padding(.leading)
    }
}

struct HashTagOverlay: View {
    var overlayText: String
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.7), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 8).fill(gradient)
            Text(overlayText)
                .font(.caption)
                .foregroundColor(.white)
                .frame(width:72)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(tagTypeName: "Trending Now", items: hashTagData)
        .environmentObject(UserData())
    }
}
