//
//  ContentView.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
 
    var body: some View {
        TabView(selection: $selection){
            Home()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
//                            .imageScale(.large)
                        Text("Home")
                    }
                }
                .tag(0)
            HashTag()
                .tabItem {
                    VStack {
                        Image(systemName: "number")
//                            .imageScale(.large)
                        Text("HashTag")
                    }
                }
                .tag(1)
            ProductRegister()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
//                            .imageScale(.large)
                        Text("Register")
                    }
                }
            .tag(2)
            ChattingRooms(chattingList: chattingData)
                .tabItem {
                    VStack {
                        Image(systemName: "bubble.left.fill")
//                            .imageScale(.large)
                        Text("Chat")
                    }
                }
                .tag(3)
            MyPage(user: userProfileData[0])
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
//                            .imageScale(.large)
                        Text("My Page")
                    }
                }
                .tag(4)

        }
        .accentColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
