//
//  MarqueeButtonView.swift
//  FruitMart
//
//  Created by twave on 2021/01/14.
//

import SwiftUI
import Marquee

struct MarqueeButtonView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geomtry in
                VStack {
                    Circle().fill(Color.blue)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .overlay(
                        Marquee {
                            Text("Go! 넵! YES!")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    )
                        .onTapGesture {


                    }
                        .marqueeDuration(5)
                    RoundedRectangle(cornerRadius: 10).fill(Color.gray)
                    
//                        .frame(width: geomtry.size.width, height: 270, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .edgesIgnoringSafeArea(.bottom)
                    

//                HStack(alignment: .center) {
//                    Rectangle().fill(Color.blue)
//                        .frame(width: 320, height: 270, alignment: .center)
//                        .overlay(
//                        ZStack {
//                            Text("asdflkasjf")
//                            Marquee {
//                                Text("Waiting 대기중 Waiting 대기중")
//                                    .font(.system(size: 70))
//                                    .foregroundColor(.white)
//                                    .bold()
//                            }
//                            ResizedImage("imgCard1NoworkM")
//                        }
//                    )
//                        .cornerRadius(20)
//                        .marqueeDuration(7)
//                }



                }
            }
        }
    }
}

struct MarqueeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MarqueeButtonView()
    }
}
