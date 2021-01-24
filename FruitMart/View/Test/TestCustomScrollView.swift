//
//  TestCustomScrollView.swift
//  FruitMart
//
//  Created by yoon on 2021/01/24.
//

import SwiftUI

struct TestCustomScrollView: View {

    var body: some View {
//        scrollStep1View
//        scrollStep2View
        scrollStep3View
    }

}
extension TestCustomScrollView {

    var scrollStep1View: some View {
        GeometryReader { geomtryReader in
            VStack {
                Text("Vertical ScrollView").font(.largeTitle)
                ScrollView {
                    ForEach(0..<10) { i in
                        Circle()
                            .fill(Color(white: 0.2 + (0.8 * Double(i) / 10)))
                            .frame(width: 80, height: 80)
                    }
                        .frame(width: geomtryReader.size.width / 2)
                }
                    .frame(height: geomtryReader.size.height / 2)
                    .padding(.bottom)

                Text("Horizontal ScrollView")
                    .font(.largeTitle)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<10) { i in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                                .frame(width: 100, height: 100)
                                .scaleEffect(1 - (0.7 * CGFloat(i) / 10))
                        }
                    }
                        .frame(height: geomtryReader.size.height / 5)
                        .padding(.horizontal)
                }
            }
        }
    }

    var scrollStep2View: some View {
        ScrollView {
            ForEach(0..<10) { _ in
                GeometryReader {
                    Rectangle()
                        .fill(self.color(from: $0))
                }
                .frame(width: 250, height: 250)
            }
        }
    }


    func color(from proxy: GeometryProxy) -> Color {
      
        let yOffset = proxy.frame(in: .global).minY - 44
        let color = min(1, 0.2 + Double(yOffset / 1000))
        return Color(hue: color, saturation: color, brightness: color)
    }
    
    var scrollStep3View : some View {
        let colors : [Color] = [.red, .green, .blue]
        return GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(colors.indices) { index in
//                        Rectangle()
                        Circle()
                            .fill(colors[index])
                            .cornerRadius(10)
                            .overlay(Text("\(index) Page").font(.largeTitle).foregroundColor(.white))
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .border(Color.black)
                }
                
            }
//            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                UIScrollView.appearance().isPagingEnabled = true
            }
            
        }
    }
}

struct TestCustomScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TestCustomScrollView()
    }
}
