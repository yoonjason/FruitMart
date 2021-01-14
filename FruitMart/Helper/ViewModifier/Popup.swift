//
//  Popup.swift
//  FruitMart
//
//  Created by twave on 2021/01/14.
//

import SwiftUI

enum PopupStyle {
    case none
    case blur
    case dimmed
}

struct Popup<Message : View>: ViewModifier {
    let size: CGSize?

    /// enum popupStyle
    let style: PopupStyle

    /// 팝업창에 나타낼 메시지 View의 제네릭 Message
    let message: Message

    init(size: CGSize? = nil, style: PopupStyle, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }

    func body(content: Content) -> some View {
        content /// 팝업창을 띄운 뷰 일반적으로 팝업창이 나타날 때 그 배경이 되는 뷰라고 생각하면 된다.
        .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle() ///dimmed스타일에만 적용한다.
        .fill(Color.red.opacity(style == .dimmed ? 0.4 : 0)))
//        .fill(Color.red.opacity(0.5)))
        .overlay(popupContent)
    }

    private var popupContent: some View {
        GeometryReader { g in
            VStack {
                self.message ///팝업창에 사용할 메시지
            }
                .frame(
                width: self.size?.width ?? g.size.width * 0.6,
                height: self.size?.height ?? g.size.height * 0.25
            )
                .background(Color.primary.colorInvert())
                .cornerRadius(12)
                .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
                .overlay(self.checkCircleMark, alignment: .top)
                .position(x: g.size.width / 2, y: g.size.height / 2)
        }
    }

    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size: 60).weight(.semibold))
            .background(Color.white.scaleEffect(0.7))
            .offset(x: 0, y: -20)
    }
    
    
}

fileprivate struct PopupToggle: ViewModifier {
    @Binding var isPresented : Bool //true일 때만 팝업창 표현
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}

extension View {
    func popup<Content : View> (
        isPresented : Binding<Bool>,
        size : CGSize? = nil,
        style : PopupStyle = .none,
        @ViewBuilder content : () -> Content
    ) -> some View {
        if isPresented.wrappedValue {
            let popup = Popup(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        }else {
            return AnyView(self)
        }
    }
}

//fileprivate struct PopupToggle : ViewModifier {
//    typealias Body = <#type#>
//
//
//}
