//
//  CustomUIAppearanceView.swift
//  FruitMart
//
//  Created by twave on 2021/01/13.
//

import SwiftUI

struct CustomUIAppearanceView: View {

    var body: some View {
        CusNaviView()
        CusSwitchView()
    }
}

///커스텀 네비게이션뷰
struct CusNaviView : View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor : UIColor.systemTeal,
            .kern : 5
        ]
        (UINavigationBar.appearance() as? UINavigationBar)?.titleTextAttributes =
        [
            .foregroundColor : UIColor.systemTeal,
            .font : UIFont.italicSystemFont(ofSize: 25)
        ]
    }
    
    var body: some View {
        NavigationView{
            Text("Hello World!!!")
                .navigationBarTitle("UIAppearance")
        }
    }
}

struct CustomUIAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomUIAppearanceView()
    }
}

///토글을 UISwitch을 외부 프록시 객체를 이용하여 커스텀하였음
struct CusSwitchView : View {
    @State private var isOn = true
    
    init() {
        UISwitch.appearance().onTintColor = .gray
        UISwitch.appearance().thumbTintColor = .orange
    }
    
    var body: some View {
        Toggle(isOn:$isOn) {
            Text("UISwitch에 대한 색상 변경")
        }
    }
}
