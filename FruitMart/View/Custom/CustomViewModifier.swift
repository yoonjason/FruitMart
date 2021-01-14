//
//  CustomViewModifier.swift
//  FruitMart
//
//  Created by twave on 2021/01/11.
//

import SwiftUI

struct CustomViewModifier: View {
    var body: some View {
        VStack {
            Text("Custom ViewModifier")
                .modifier(CustomModifier(borderColor: .blue))
            Text("Custom ViewModifier View Extensions")
                .customModifier(borderColor: .green)
                
            Text("My Modifiers")
                .modifier(MyModifier1().concat(MyModifier2()))
        }
    }
}

struct CustomViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}

struct CustomModifier: ViewModifier {
    var borderColor: Color = .red

    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.white)
            .padding()
            .background(Rectangle().fill(Color.gray))
            .border(borderColor, width: 2)
            
    }
}

struct MyModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title)
    }
}

struct MyModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.blue)
    }
}

extension View {
    func customModifier(borderColor: Color = .red) -> some View {
        self.modifier(CustomModifier(borderColor: borderColor))
    }
}
