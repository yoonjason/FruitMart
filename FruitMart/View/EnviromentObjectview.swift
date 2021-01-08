//
//  EnviromentObjectview.swift
//  FruitMart
//
//  Created by twave on 2021/01/08.
//

import SwiftUI

struct EnviromentObjectview: View {
    @State private var showingAlert : Bool = false
    
    var body: some View {
//        SuperView().environmentObject(User())
        Button(action: { self.showingAlert.toggle() }) {
          Text("Alert")
        }
        .alert(isPresented: $showingAlert) {
          Alert(
            title: Text("제목"),
            message: Text("내용"),
            primaryButton: .default(Text("확인"), action: { print("확인") }),
            secondaryButton: .cancel(Text("취소"))
          )
        }
    }
}

struct EnviromentObjectview_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectview()
    }
}

struct SuperView:View {
    var body : some View {
        SubView()
    }
}

struct SubView : View {
    @EnvironmentObject var user : User
    var body: some View {
        Text(user.name.description)
    }
}
