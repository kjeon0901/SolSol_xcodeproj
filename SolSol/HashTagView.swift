//
//  HashTagView.swift
//  SolSol
//
//  Created by chopper on 2020/04/05.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct HashTagView: View {
    var category: HashTagItem.Category
    
    @State private var showDetail = false

    var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }

    var body: some View {
        VStack {
            Button(action: {
                self.showDetail.toggle()
            }) {
                HStack {
                    Image(systemName: category.icon)
                        .imageScale(.large)
                    Text(category.rawValue.uppercased())
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .scaleEffect(self.showDetail ? 1.3 : 1.0)
                .padding(24)
            }
            .background(category.color)
            .opacity(self.showDetail ? 1 : 0.8)
            .cornerRadius(8)
            .padding([.leading, .trailing])
            
            if showDetail {
                HashTagDetail(category: category)
            }
        }
    }
}

struct HashTagView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HashTagView(category: HashTagItem.Category.people)
            Spacer()
        }
    }
}
