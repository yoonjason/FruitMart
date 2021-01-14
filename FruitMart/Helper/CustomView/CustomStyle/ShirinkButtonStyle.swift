//
//  ShirinkButtonStyle.swift
//  FruitMart
//
//  Created by twave on 2021/01/14.
//

import SwiftUI

struct ShirinkButtonStyle: ButtonStyle {
    
    var minScale : CGFloat = 0.9
    var minOpacity : Double = 0.6
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minScale : 1.0)
            .opacity(configuration.isPressed ? minOpacity : 1.0)
    }

}

struct ShirinkButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action:{}){
            Text("Button")
                .padding()
                .padding(.horizontal)
                .background(Capsule().fill(Color.yellow))
        }
        .buttonStyle(ShirinkButtonStyle())
    }
}
