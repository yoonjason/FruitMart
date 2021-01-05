//
//  SignInView.swift
//  FruitMart
//
//  Created by twave on 2021/01/04.
//

import SwiftUI

struct SignInView: View {
    let fruits = ["사과", "배", "포도", "바나나"]
    let drinks = ["물", "우유", "탄산수"]

    var body: some View {
//        let titles = ["Fruits", "Drinks"]
//        let data = [fruits, drinks]
//        return List {
//            ForEach(data.indices) { index in
//                Section(header: Text(titles[index]).font(.largeTitle), footer: HStack {
//                    Spacer();
//                    Text("\(data[index].count) 건")
//                }){
//                    ForEach(data[index], id:\.self){
//                        Text($0)
//                    }
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())

//        HStack{
//          Rectangle().fill(Color.yellow)
//            .frame(width: 30)
//
//          VStack {
//
//            Rectangle().fill(Color.blue)
//              .frame(height: 200)
//
//            GeometryReader {
//              self.contents(geometry: $0)
//                .position(x: $0.size.width / 2, y: $0.size.height / 2)
//            }
//            .background(Color.green)
//            .border(Color.red, width: 4)
//          }
//          .coordinateSpace(name: "VStackCS")
//        }
//        .coordinateSpace(name: "HStackCS")

        VStack(spacing: 100) {
            Group {
                Text("FixedSize를 적용하면 글자가 생략되지 않습니다.")

                Text("FixedSize를 적용하면 글자가 생략되지 않습니다.").font(.title)
                    .fixedSize(horizontal: true, vertical: false)
                Text("FixedSize를 적용하면 글자가 생략되지 않습니다.").font(.title)
                    .fixedSize(horizontal: false, vertical: true)

            }
                .font(.title)
                .frame(width: 150, height: 40)
            layoutPriority
        }


    }

    var leadingItem: some View { Button(action: { print("Leading item tapped") }, label: {
            Image(systemName: "bell").imageScale(.large).accentColor(.black)
        })
    }

    func contents(geometry g: GeometryProxy) -> some View {
        VStack {
            Text("Local").bold()
            Text(stringFormat(for: g.frame(in: .local).origin)).padding(.bottom)

            Text("Global").bold()
            Text(stringFormat(for: g.frame(in: .global).origin)).padding(.bottom)

            Text("Named VStackCS").bold()
            Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin))
                .padding(.bottom)

            Text("Named HStackCS").bold()
            Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin))
                .padding(.bottom)
        }
    }

    func stringFormat(for point: CGPoint) -> String {
        String(format: "(x: %.f, y: %.f)", arguments: [point.x, point.y])
    }

    var layoutPriority: some View {
        VStack {
            HStack { //우선순위 미 적용
                Color.red
                Color.green
                Color.blue
            }.frame(height: 40)


            HStack(spacing:0) { // 우선순위 변경
                Color.red.layoutPriority(1)
                Color.green
                Color.blue.layoutPriority(1)
            }
                .frame(height: 40)

            HStack { //min, max 조건 설정
                Color.red.layoutPriority(1)
                Color.green.frame(minWidth: 30)
                Color.blue.frame(maxWidth: 50).layoutPriority(1)
            }.frame(height: 40)

            HStack { //고정 크기 frame
                Color.red.frame(width: 50)
                Color.green.layoutPriority(1)
                Color.blue.frame(maxWidth: 50).layoutPriority(1)
            }.frame(height: 40)
        }

    }



}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
