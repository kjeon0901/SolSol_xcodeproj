//
//  TimelineList.swift
//  SolSol
//
//  Created by chopper on 2020/04/05.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct TimelineList: View {
    var title: String
    
    var body: some View {
        List {
            ForEach(timelineData) { item in
                TimelineRow(timeline: item, userProfile: userProfileData[0])
            }
        }
        .navigationBarTitle(Text("#\(title)"))
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "rectangle.stack.person.crop")
                .imageScale(.large)
            .accessibility(label: Text("follow"))
        })
    }
}

struct TimelineList_Previews: PreviewProvider {
    static var previews: some View {
        TimelineList(title: "timeline")
        .environmentObject(UserData())
    }
}
