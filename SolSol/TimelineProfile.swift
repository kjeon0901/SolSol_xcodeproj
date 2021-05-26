//
//  TimelineProfile.swift
//  SolSol
//
//  Created by chopper on 2020/04/06.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct TimelineProfile: View {
    var user: UserProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                self.user.profileImage
                    .resizable()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.user.userName)
                            .font(.title)
                        Text("following")
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(lineWidth: 1)
                                .shadow(color: .blue, radius: 8)
                        )
                    }
                    Text("@\(self.user.userId)")
                        .foregroundColor(.gray)
                    HStack {
                        Text("follower \(self.user.follower)")
                        Text("following \(self.user.following)")
                    }
                }
            }
            Text(self.user.description)
//            Spacer()
            HStack(spacing: 0) {
                VStack(spacing: 4) {
                    Button(action: {}) {
                        Text("Post")
                            .foregroundColor(.black)
                    }
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                }
                VStack(spacing: 4) {
                    Button(action: {}) {
                        Text("Community")
                            .foregroundColor(.gray)
                    }
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                }
            }
            .font(.headline)
            
            GridImageView(self.user.myItems)
        }
        .padding(.top, 32)

        .navigationBarItems(trailing:
            HStack {
                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                    .accessibility(label: Text("information"))
                    .padding()
                }
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    .accessibility(label: Text("send"))
                    .padding()
                }
            }
        )

    }
}

struct GridCell: View {
    var photoName: String
    
    var body: some View {
        ImageStore.shared.image(name: photoName)
            .resizable()
            .scaledToFit()
    }
}

struct TimelineProfile_Previews: PreviewProvider {
    static var previews: some View {
        TimelineProfile(user: userProfileData[0])
            .environmentObject(UserData())
    }
}
