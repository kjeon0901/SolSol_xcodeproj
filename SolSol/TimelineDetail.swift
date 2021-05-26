//
//  TimelineDetail.swift
//  SolSol
//
//  Created by chopper on 2020/04/08.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct TimelineDetail: View {
    var timeline: Timeline
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                PageView(timeline.photoImages.map { FeatureCard(photoImage: $0) })
                    .aspectRatio(1, contentMode: .fill)
                Spacer()
                Group {
                    Text(timeline.description)
                        .font(.system(size: 14, weight: .light))
                    Text(timeline.hashtag)
                        .font(.system(size: 14, weight: .light))
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
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 36)
                    .foregroundColor(.pink)
                    .overlay(
                        Text("Detail")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .bold()
                    )
                    .padding([.top, .bottom], 16)
                HStack(alignment: .bottom) {
                    Text("[chanel]".uppercased())
                        .font(.subheadline)
                        .bold()
                    Text("a sleeveless tweed ops.")
                        .font(.subheadline)
                        .bold()
                }

                HStack {
                    
                    VStack(alignment: .leading) {
                        Button(action: {}) {
                            Text("rent".uppercased())
                                .font(.headline)
                                .frame(width: 160, height: 36)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder()
                                    .shadow(color: .gray, radius: 8)
                                )
                        }
                        Group {
                            Text("30 USD / Day")
                            Text("Dec 10 - Dec 31")
                            Text("Ship")
                            Text("Delivery within 20 miles")
                        }
                        .padding(4)
                        .font(.caption)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Button(action: {}) {
                            Text("buy".uppercased())
                                .font(.headline)
                                .frame(width: 160, height: 36)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder()
                                    .shadow(color: .gray, radius: 8)
                                )
                        }
                        Group {
                            Text("250 USD")
                            Text("Jan 10")
                            Text("Ship")
                            Text("Delivery within 20 miles")
                        }
                        .padding(4)
                        .font(.caption)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle(timeline.userName)
        }
    }
}

struct TimelineDetail_Previews: PreviewProvider {
    static var previews: some View {
        TimelineDetail(timeline: timelineData[0])
    }
}
