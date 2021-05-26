//
//  GridImageView.swift
//  SolSol
//
//  Created by chopper on 2020/04/06.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct GridImageView: View {
    private let myItems: [MyItem]

    private let columns: Int
    private let vSpacing: CGFloat
    private let hSpacing: CGFloat
    private let vPadding: CGFloat
    private let hPadding: CGFloat
    private let isScrollable: Bool
    private let showScrollIndicators: Bool
    
    private var rows: Int {
        self.myItems.count / self.columns
    }
    
    public init(_ myItems: [MyItem],
                columns: Int = 3,
                vSpacing: CGFloat = 0,
                hSpacing: CGFloat = 0,
                vPadding: CGFloat = 0,
                hPadding: CGFloat = 0,
                isScrollable: Bool = true,
                showScrollIndicators: Bool = false) {
      self.myItems = myItems
      self.columns = max(1, columns)
      self.vSpacing = vSpacing
      self.hSpacing = hSpacing
      self.vPadding = vPadding
      self.hPadding = hPadding
      self.isScrollable = isScrollable
      self.showScrollIndicators = showScrollIndicators
    }

    var body: some View {
        GeometryReader { geometry in
            Group {
                if self.isScrollable {
                    ScrollView(showsIndicators: self.showScrollIndicators) {
                        self.content(using: geometry)
                    }
                } else {
                    self.content(using: geometry)
                }
            }
            .padding(.horizontal, self.hPadding)
            .padding(.vertical, self.vPadding)
        }
    }
    
    private func rowAtIndex(_ index: Int, geometry: GeometryProxy, isLastRow: Bool = false) -> some View {
        HStack(spacing: self.hSpacing) {
            ForEach(0..<(isLastRow ? self.myItems.count % self.columns : self.columns)) { column in
                ZStack {
                    self.myItems[index + column].photoImage
                        .resizable()
                    if self.myItems[index + column].status == MyItem.ItemStatus.renting {
                        Image("forrent")
                        .resizable()
                        .frame(width: 48, height: 36)
                        .offset(x: 32, y: -40)
                    }
                    if self.myItems[index + column].status == MyItem.ItemStatus.sold {
                        Rectangle().opacity(0.7)
                        Text("sold".uppercased())
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .frame(width: self.contentWidthFor(geometry), height: self.contentWidthFor(geometry))
            }
            if isLastRow {
                Spacer()
            }
        }
    }
    
    private func content(using geometry: GeometryProxy) -> some View {
        VStack(spacing: self.vSpacing) {
            ForEach(0..<self.rows) { row in
                self.rowAtIndex(row * self.columns, geometry: geometry)
            }
            if (self.myItems.count % self.columns > 0) {
                self.rowAtIndex(self.columns * self.rows, geometry: geometry, isLastRow: true)
            }
        }
    }
    
    private func contentWidthFor(_ geometry: GeometryProxy) -> CGFloat {
        let hSpacings = hSpacing * (CGFloat(self.columns) - 1)
        let width = geometry.size.width - hSpacings - hPadding * 2
        return width / CGFloat(self.columns)
    }

}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        GridImageView(userProfileData[0].myItems)
        .environmentObject(UserData())
    }
}
