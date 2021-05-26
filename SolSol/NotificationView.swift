//
//  NotificationView.swift
//  SolSol
//
//  Created by chopper on 2020/04/08.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    let eventImages: [Image] = [
        ImageStore.shared.image(name:"event1"),
        ImageStore.shared.image(name:"event2"),
        ImageStore.shared.image(name:"event3")
    ]
    
    var notifications: [String: [NotificationItem]] {
        var dic: [String: [NotificationItem]] = ["today": [NotificationItem](), "this week": [NotificationItem](), "this month": [NotificationItem]()]
        notificationData.forEach { item in
            if item.createDate.timeIntervalSinceNow >= -(60 * 60 * 24) {
                dic["today"]?.append(item)
            } else if item.createDate.timeIntervalSinceNow >= -(60 * 60 * 24 * 7) {
                dic["this week"]?.append(item)
            } else if item.createDate.timeIntervalSinceNow >= -(60 * 60 * 24 * 30) {
                dic["this month"]?.append(item)
            }
        }
        return dic
    }


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                PageView(eventImages.map { EventCard(eventImage: $0) })
                    .aspectRatio(2.6, contentMode: .fit)
                
                ForEach(Array(notifications.keys.sorted(by: {$0.count < $1.count})), id: \.self) { key in
                    VStack(alignment: .leading) {
                        Text(key)
                            .font(.headline)
                        ForEach(self.notifications[key]!) { item in
                            HStack(spacing: 16) {
                                ImageStore.shared.image(name: item.userName)
                                    .resizable()
                                    .frame(width:48, height: 48)
                                    .clipShape(Circle())
                                Text("\(item.userId) \(item.message)")
                                    .frame(height: 48)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitle("Notification")
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
