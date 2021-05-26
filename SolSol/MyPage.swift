//
//  MyPage.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct MyPage: View {
    var user: UserProfile
    @State private var showImagePicker: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 16) {
                            self.user.profileImage
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(self.user.userName)
                                        .font(.headline)
                                    Spacer()
                                    Image(self.user.membership.rawValue)
                                        .resizable()
                                        .frame(width:18, height: 18)
                                    Text(self.user.membership.rawValue.capitalized)
                                        .font(.subheadline)
                                }
                                Text("@\(self.user.userId)")
                                    .font(.subheadline)
                                HStack {
                                    Text("follower: \(self.user.follower)")
                                    Spacer()
                                    Text("following: \(self.user.following)")
                                }
                                .font(.subheadline)
                            }
                        }
                    }
                    Text(self.user.description)
                        .font(.subheadline)
                        .frame(minHeight: 48)

                    VStack(alignment: .center) {
                        Text("anticipated revenue".capitalized)
                        Text("$ \(self.user.anticipatedRevenue, specifier: "%.2f")")
                            .font(.largeTitle)
                    }
                    .padding([.top, .bottom], 22)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.white)
                    .background(Color.accentColor.opacity(0.6))
                    .cornerRadius(4)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 16) {
                            VStack(alignment: .center, spacing: 4) {
                                Text("\(self.user.beforeDeposit)")
                                Text("deposit")
                            }
                            Divider()
                            VStack(alignment: .center, spacing: 4) {
                                Text("\(self.user.preparing)")
                                Text("preparing")
                            }
                            Divider()
                            VStack(alignment: .center, spacing: 4) {
                                Text("\(self.user.shipping)")
                                Text("shipping")
                            }
                            Divider()
                            VStack(alignment: .center, spacing: 4) {
                                Text("\(self.user.delivered)")
                                Text("delivered")
                            }
                        }
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity)

                    VStack(alignment: .leading) {
                        HStack {
                            Text("My Items")
                            NavigationLink(destination: TimelineProfile(user: user)) {
                                Text("more")
                            }
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 8) {
                                ForEach(self.user.myItems, id: \.self) { item in
                                    item.photoImage
                                        .resizable()
                                        .cornerRadius(8)
                                        .frame(width: 96, height: 96)
                                        .overlay(HashTagOverlay(overlayText: (item.status != .none) ? item.status.rawValue: ""))
                                }
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                NavigationLink(destination: NotificationView()) {
                                    HStack {
                                        Image(systemName: "bell")
                                        Text("notification".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "hand.thumbsup")
                                        Text("like".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "rectangle.stack.person.crop")
                                        Text("following".capitalized)
                                    }
                                }
                            }
                            HStack {
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "l.circle")
                                        Text("lending/selling".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "s.circle")
                                        Text("sold".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "arrow.right.arrow.left.circle")
                                        Text("price negotiation".capitalized)
                                    }
                                }
                            }
                            HStack {
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "r.circle")
                                        Text("renting".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "cart")
                                        Text("purchased".capitalized)
                                    }
                                }
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "dollarsign.circle")
                                        Text("income  statement".capitalized)
                                    }
                                }
                            }
                            HStack {
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "questionmark.circle")
                                        Text("help".capitalized)
                                    }
                                }
                            }
                        }
                        .padding(1)
                        .buttonStyle(MyPageButtonStyle())
                    }
                }
                .padding()
                .sheet(isPresented: self.$showImagePicker) {
                        TimelineProfile(user: userProfileData[0])
                }
                .navigationBarTitle("My Page")
                .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            self.showImagePicker.toggle()
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                            .accessibility(label: Text("edit"))
                        }
                    }
                )
                .navigationBarItems(leading: Image("logo").resizable().frame(width:32, height: 32))

            }

        }
    }
}

struct MyPageButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding()
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .background(Color.white)
//            .border(Color.accentColor)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
    }
}

struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage(user: userProfileData[0])
            .environmentObject(UserData())
    }
}
