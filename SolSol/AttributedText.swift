//
//  AttributedText.swift
//  SolSol
//
//  Created by chopper on 2020/04/14.
//  Copyright © 2020 dHP. All rights reserved.
//

import SwiftUI

struct AttributedText: UIViewRepresentable {
    var attributedText: NSMutableAttributedString
    
    init(_ attributedText: NSMutableAttributedString) {
        self.attributedText = attributedText
    }
    
    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }
    
    func updateUIView(_ label: UITextView, context: Context) {
        label.attributedText = self.attributedText
    }
}
