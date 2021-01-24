//
//  TestCustomTabBarView.swift
//  FruitMart
//
//  Created by yoon on 2021/01/24.
//

import SwiftUI

struct TestCustomTabBarView: View {
    var body: some View {
//        TestCustomTabbarStep1View()
        TestCustomTabbarStep2View()
        
    }
}

struct TestCustomTabbarStep1View: View {
    var body: some View {
        TabView {
            VStack {
                Text("첫번째 탭").font(.largeTitle)
                Image("SwiftUI")
            }.tabItem { Image(systemName: "house")
                Text("아이템 1")
            }

            Text("두 번째 탭의 화면")
                .font(.title)
                .padding()
                .background(Color.yellow)
                .tabItem {
                Image(systemName: "cube")
                Text("아이템 2")
            }
            SomeTestTabBarView()
                .tabItem {
                Image(systemName: "person")
                Text("아이템 3")
            }
        }

    }
}

struct SomeTestTabBarView: View {
    var body: some View {
        VStack {
            Text("실제는 이런 식으로")
            Text("별도의 뷰를 만들어서 사용하겠죠.")
        }
            .font(.title)
    }
}

struct TestCustomTabbarStep2View: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<3) { index in
                Text("태그 \(index)").font(.largeTitle).fontWeight(.bold)
                    .tag(index)
                    .tabItem {
                    Image(systemName: self.selectedTab != index ? "\(index).square" : "\(index).square.fill")
                        .imageScale(.large)

                }
            }
        }
        .accentColor(.red)
    }
}

struct TestCustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TestCustomTabBarView()
    }
}
