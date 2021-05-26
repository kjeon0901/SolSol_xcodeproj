//
//  HashTag.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct HashTag: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(HashTagItem.Category.allCases, id: \.self) { category in
                        HashTagView(category: category)
                    }
                    Spacer()
                }
                
                .navigationBarTitle(Text("Choose From"))
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "bag")
                    .imageScale(.large)
                    .accessibility(label: Text("cart"))
                })
                .navigationBarItems(leading: Image("logo").resizable().frame(width:32, height: 32))

            }
        }
    }
}

struct HashTag_Previews: PreviewProvider {
    static var previews: some View {
        HashTag()
    }
}
