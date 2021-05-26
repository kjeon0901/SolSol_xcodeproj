//
//  TimelineRow.swift
//  SolSol
//
//  Created by chopper on 2020/04/04.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct TimelineRow: View {
    @State fileprivate var showingProfile = false
    @State private var play: Bool = true
    
    var timeline: Timeline
    var userProfile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                timeline.profileImage
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 32, height: 32)
                Button(action: {
                    self.showingProfile.toggle()
                }) {
                    Text(timeline.userName)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                if timeline.following {
                    Text("following")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } else {
                    Text("follow")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                Spacer()
                Text(timeline.createDate)
                    .font(.footnote)
            }
            NavigationLink(destination: TimelineDetail(timeline: timeline)) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        if self.timeline.videoName.count > 0 {
                            VideoPlayer(url: Bundle.main.url(forResource: self.timeline.videoName, withExtension: ".mp4")!, play: $play)
                            .autoReplay(true)
                            .mute(true)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(16)
//                            .frame(width: 304, height: 304)
                        }
                        ForEach(0..<timeline.photoImages.count) { index in
                            self.timeline.photoImages[index]
                                .resizable()
                                .frame(width: 304, height: 304)
                        }
                    }
                }
            }.buttonStyle(PlainButtonStyle())
            Group {
                Text("\(timeline.userName)  ").bold() + Text(timeline.description)
                    .font(.system(size: 14, weight: .light))
            }
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "heart")
                Image(systemName: "bubble.left")
                Image(systemName: "tray.and.arrow.down")
                Image(systemName: "arrowshape.turn.up.right")
            }
            Text("likes \(timeline.likes)")
                .foregroundColor(.accentColor)
                .font(.system(size: 14, weight: .light))

        }
        .sheet(isPresented: $showingProfile) {
            TimelineProfile(user: userProfileData[0])
        }
    }
}

struct TimelineRow_Previews: PreviewProvider {
    static var previews: some View {
        TimelineRow(timeline: timelineData[2], userProfile: userProfileData[0])
            .environmentObject(UserData())
    }
}
