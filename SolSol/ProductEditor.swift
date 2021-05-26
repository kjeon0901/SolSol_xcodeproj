//
//  ProductEditor.swift
//  SolSol
//
//  Created by chopper on 2020/04/08.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ProductEditor: View {
    @Binding var product: ProductItem
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image?
    
    var body: some View {
        
        VStack {
            VStack {
                TextField("Instagram ID: ", text: .constant(""))
                TextField("Youtube: ", text: .constant(""))
                TextField("Tiktok: ", text: .constant(""))
            }
            HStack {
                TextField("write...", text: $product.description)
                    .frame(height: 150)
                Button(action: {
                    self.showImagePicker.toggle()
                }) {
                    Image(systemName: "camera.on.rectangle")
                        .imageScale(.large)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    Button("#dress") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#vintage") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#fishing") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#badminton") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#bike") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#tennis") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#drive") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#laptop") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#barbell") {}
                        .buttonStyle(TagButtonStyle())
                    Button("#laptop") {}
                        .buttonStyle(TagButtonStyle())
                }
                .font(.headline)
                .padding(8)
            }
                
            HStack {
                HStack {
                    Text("rental")
                        .bold()
                        .frame(width: 84)
                    TextField("USD", value: $product.rentalPrice, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("purchase")
                        .bold()
                        .frame(width: 84)
                    TextField("USD", value: $product.purchasePrice, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
            }
            VStack {
                TextField("I can meet you at (this place).", text: $product.location)
//                TextField("I can meet you at (this place).", text: $product.location)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Register Item")
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}

struct ProductEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProductEditor(product: .constant(.default))
    }
}

struct TagButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .font(.body)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
    }
}

