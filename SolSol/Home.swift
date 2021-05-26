//
//  Home.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State private var searching: String = "search"
    var trendTags: [HashTagItem] {
        hashTagData.filter {
            $0.tagType == HashTagItem.TagType.trend
        }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    CategoryRow(tagTypeName: trendTags[0].tagType.rawValue, items: trendTags)
                        .padding(.bottom, 16)
//                        .listRowInsets(EdgeInsets())
                    Group {
                        ForEach(timelineData) { item in
                            TimelineRow(timeline: item, userProfile: userProfileData[0])
                        }
                    }
                    .padding()
                }
            }
//            .onAppear() {
//                UITableView.appearance().separatorStyle = .none
//            }
                
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                        .accessibility(label: Text("search"))
                    }
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .imageScale(.large)
                        .accessibility(label: Text("cart"))
                    }
                }
            )
            .navigationBarItems(leading: Image("logo").resizable().frame(width:32, height: 32))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
                .colorScheme(.light)
                .environmentObject(UserData())
        }
    }
}
