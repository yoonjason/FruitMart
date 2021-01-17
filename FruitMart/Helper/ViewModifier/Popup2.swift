//
//  Popup2.swift
//  FruitMart
//
//  Created by twave on 2021/01/17.
//

import SwiftUI

struct Popup2<Message:View>: ViewModifier {
    //Message라는 뷰를 UIView만 해당되는 것은 아님. 아무튼 뷰를 제네릭으로 하는(뷰만 들어올 수 있다 이말이야)
    let size: CGSize?
    let style: PopupStyle
    let message: Message

    init(size: CGSize? = nil, style: PopupStyle = .none, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }

    func body(content: Content) -> some View {
        content //팝업창을 띄운 뷰, 전체화면이라고 보면 됨
        .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle()
            .fill(Color.blue.opacity(style == .dimmed ? 0.4 : 0)))
            .overlay(popupContent) // 팝업창으로 표현될 뷰
    }

    private var popupContent: some View {
        GeometryReader {
//            geometryReader in
            VStack {
                self.message
                //2개 이상의 뷰가 있으면 세로 방향으로 나열되도록 VStack으로 감싸주었다.
            }
                .frame(
                width: self.size?.width ?? $0.size.width * 0.6,
                height: self.size?.height ?? $0.size.height * 0.25
            )
                .background(Color.primary.colorInvert())
                .cornerRadius(12)
                .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
                .overlay(checkCircleMark, alignment: .top)
        }
    }

    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size: 60).weight(.semibold))
//            .background(Color.white.scaleEffect(0.8))
        .background(Color.clear)
            .offset(x: 0, y: -20)
    }
}

fileprivate struct PopupToggle: ViewModifier {
    @Binding var isPresented: Bool
    func body(content: Content) -> some View {
        content
            .disabled(isPresented) //값이 true이면 onTapGesture 외에 다른 부분은 적용되지 않는다.
        .onTapGesture {
            self.isPresented.toggle()
        }
    }
}

fileprivate struct PopupItem2<Item : Identifiable>: ViewModifier {
    @Binding var item: Item?
    func body(content: Content) -> some View {
        content
            .disabled(item != nil)
            .onTapGesture {
            self.item = nil
        }
    }
}

extension View {
    func popup2<Content : View> (isPresented: Binding<Bool>, size: CGSize? = nil, style: PopupStyle = .none, @ViewBuilder content: () -> Content) -> some View { //1 isPresented, 2.viewbuilder
        if isPresented.wrappedValue { //3
            let popup = Popup2(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)//4
            return AnyView(modifiedContent)//5
        } else {
            return AnyView(self)//5
        }

    }

    func popup22<Content : View, Item : Identifiable>(item: Binding<Item?>, size: CGSize? = nil, style: PopupStyle = .none, @ViewBuilder content: (Item) -> Content) -> some View {
        if let selectedItem = item.wrappedValue {
            let content = content(selectedItem)
            let popup = Popup2(size: size, style: style, message: content)
            let popItem = PopupItem2(item: item)
            let modifiedContent = self.modifier(popup).modifier(popItem)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}

//struct Popup2: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Popup2_Previews: PreviewProvider {
//    static var previews: some View {
//        Popup2()
//    }
//}
