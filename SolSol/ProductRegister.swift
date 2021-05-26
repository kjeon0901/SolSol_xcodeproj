//
//  RegisterItem.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ProductRegister: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProduct = ProductItem.default
    @State private var showCamera: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ProductEditor(product: .constant(.default))
            }
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {}) {
                        Image(systemName: "tray.and.arrow.down")
                            .imageScale(.large)
                        .accessibility(label: Text("save"))
                    }
                }
            )
            .navigationBarItems(leading: Image("logo").resizable().frame(width:32, height: 32))

        }
        .sheet(isPresented: self.$showCamera, content: {
            ImagePickerView(showImagePicker: self.$showCamera, image: .constant(Image("")))
        })
        .onAppear {
            self.showCamera = true
        }
        .onDisappear {
            self.showCamera = false
        }
    }
}

struct ProductRegister_Previews: PreviewProvider {
    static var previews: some View {
        ProductRegister()
        .environmentObject(UserData())
    }
}
