//
//  ImagePIckerView.swift
//  SolSol
//
//  Created by chopper on 2020/04/10.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePickerController(isShown: $showImagePicker, image: $image)
    }
}

struct ImagePIckerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
