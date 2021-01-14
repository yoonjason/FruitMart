//
//  ButtonSuctomView.swift
//  FruitMart
//
//  Created by twave on 2021/01/13.
//

import SwiftUI

struct ButtonSuctomView: View {
    var body: some View {
        VStack(spacing: 30) {
//            Button("커스텀 버튼 스타일1") { }
//                .buttonStyle(CustomButtonStyle(backgroundColor: .green))
//            Button(action:{}) {
//                Text("zzzz")
//            }

            CustomButtonView()
            CustomPrimitiveButtonView()
            CustomToggleView()
            
        }
    }
}


struct ButtonSuctomView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSuctomView()
    }
}

struct CustomButtonView: View {
    var body: some View {
        Button("기본 버튼 스타일") { print("기본 버튼") }

        Button("커스텀 버튼 스타일 1") { print("커스텀 버튼1") }
            .buttonStyle(CustomButtonStyle(backgroundColor: .green))
        Button("커스텀 버튼 스타일2") { }
            .buttonStyle(CustomButtonStyle(cornerRadius: 5))
    }
}

/// ButtonStyle은 버튼의 눌림 상태에 따라 버튼 외형을 정의하기 위한 프로토콜입니다.
struct CustomButtonStyle: ButtonStyle {

    var backgroundColor: Color = .blue
    var cornerRadius: CGFloat = 6

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor))
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)

    }
}

struct CustomPrimitiveButtonView: View {
    var body: some View {
        Text("Primitive Style").font(.largeTitle)
        Button("커스텀 버튼 스타일1") { }
            .buttonStyle(CustomPrimitiveButtonStyle())
        Button("커스텀 버튼 스타일2") { }
            .buttonStyle(CustomPrimitiveButtonStyle(minimumDuration: 100))
    }
}

/// PrimitiveButtonStyle은 버튼 이벤트의 발생 조건과 시점을 제어할 때 사용하는 프로토콜입니다.
struct CustomPrimitiveButtonStyle: PrimitiveButtonStyle {
    var minimumDuration = 0.5
    @GestureState private var isPressed = false

    func makeBody(configuration: Configuration) -> some View {
        let longPress = LongPressGesture(minimumDuration: minimumDuration)
            .updating($isPressed) { value, state, _ in
            state = value
        }.onEnded { _ in
            configuration.trigger()
        }
        return configuration.label
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .gesture(longPress)
    }
}

struct CustomToggleView : View {
 
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing : 20) {
            Toggle("기본 토글",isOn : $isOn)
            Toggle("커스텀 토글", isOn: $isOn)
                .toggleStyle(CustomToggleStyle())
            
        }
        .font(.largeTitle)
    }
}

/// ToggleStyle은 on, off 상태를 언제 변경할 것인지, 또 이에 따라 어떻게 보여질지 정의하기 위한 프로토콜입니다.
struct CustomToggleStyle: ToggleStyle {
    let size: CGFloat = 30

    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return HStack {
            configuration.label
            Spacer()
            ZStack(alignment: isOn ? .top : .bottom) {
                Capsule().fill(isOn ? Color.green : Color.red)
                    .frame(width: size, height: size * 2)
                Circle()
                    .frame(width: size - 2, height: size - 2)
                    .onTapGesture {
                    withAnimation {
                        configuration.isOn.toggle()
                    }
                }
            }
        }
    }
}
