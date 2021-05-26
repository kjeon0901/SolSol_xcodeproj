//
//  ChattingRooms.swift
//  SolSol
//
//  Created by chopper on 2020/04/08.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ChattingRooms: View {
    var chattingList: [ChattingItem]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chattingList) { item in
//                    NavigationLink(destination: ChattingDetail()) {
                        ChattingRow(chatting: item)
//                    }
//                    .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                        .accessibility(label: Text("search"))
                    }
                    Button(action: {}) {
                        Image(systemName: "plus.bubble")
                            .imageScale(.large)
                        .accessibility(label: Text("add chat"))
                    }
                }
            )
            .navigationBarItems(leading: Image("logo").resizable().frame(width:32, height: 32))

            .navigationBarTitle("Chat")
        }
    }
}



struct ChattingRooms_Previews: PreviewProvider {
    static var previews: some View {
        ChattingRooms(chattingList: chattingData)
        .environmentObject(UserData())
    }
}
