//
//  Symbol.swift
//  FruitMart
//
//  Created by twave on 2021/01/14.
//

import SwiftUI

struct Symbol: View {
    let systemName : String
    let imageScale : Image.Scale
    let color : Color?
    
    init(_ systemName : String, imageScale : Image.Scale = .medium, color : Color? = nil) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}

struct Symbol_Previews: PreviewProvider {
    static var previews: some View {
        Symbol("heart.fill")
    }
}
