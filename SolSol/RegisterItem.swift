//
//  RegisterItem.swift
//  SolSol
//
//  Created by chopper on 2020/03/18.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ProductRegister: View {
    @Binding var product: ProductItem
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Rental Price")
                            .bold()
                        Divider()
                        TextField("USD", value: $product.rentalPrice, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Purchase Price")
                            .bold()
                        Divider()
                        TextField("USD", value: $product.purchasePrice, formatter: NumberFormatter())
                    }
                }
                Section(header: Text("I can meet you at")) {
                    TextField("location", text: $product.location)
                }
            }
            .navigationBarTitle("Register Item")
        }
    }
}

struct RegisterItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductRegister(product: .constant(.default))
    }
}
