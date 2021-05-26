//
//  ChattingRow.swift
//  SolSol
//
//  Created by chopper on 2020/04/08.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ChattingRow: View {
    var chatting: ChattingItem
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        HStack {
            self.chatting.chattingRoomImage
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .overlay(
                    Circle().fill((self.chatting.unread ? Color.accentColor : Color.clear))
                        .frame(width: 8, height: 8)
                    .offset(x:-30, y: -30)
                )
            VStack(alignment: .leading) {
                Text(self.chatting.chatName)
                    .font(.headline)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                Text(self.chatting.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
            Spacer()
            Text("\(self.chatting.lastDate, formatter: Self.dateFormat)")
                .font(.subheadline)
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
        }
    }
}

struct ChattingRow_Previews: PreviewProvider {
    static var previews: some View {
        ChattingRow(chatting: chattingData[0])
    }
}
