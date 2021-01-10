//
//  EnviromentObjectview.swift
//  FruitMart
//
//  Created by twave on 2021/01/08.
//

import SwiftUI

struct EnviromentObjectview: View {
    @State private var showingAlert : Bool = false
    @State private var showingActionSheet = false
    @State private var showingSheet = false
    
    var body: some View {
//        SuperView().environmentObject(User())
//        Button(action: { self.showingAlert.toggle() }) {
//          Text("Alert")
//        }
//        .alert(isPresented: $showingAlert) {
//          Alert(
//            title: Text("제목"),
//            message: Text("내용"),
//            primaryButton: .default(Text("확인"), action: { print("확인") }),
//            secondaryButton: .cancel(Text("취소"))
//          )
//        }
        
//        Button(action:{ self.showingActionSheet = true }){
//            Text("ActionSheet")
//        }
//        .actionSheet(isPresented:$showingActionSheet) {
//            ActionSheet(
//                title: Text("제목"),
//                message: Text("내용"),
//                buttons: [
//                    .default(Text("버튼1")),
//                    .default(Text("버튼2")),
//                    .destructive(Text("버튼3")),
//                    .cancel(Text("취소"))
//
//                ]
//            )
//        }
        presentView
    }
    
    var presentView : some View {
        Button(action:{self.showingSheet.toggle()}) {
            Text("Present")
                .font(.title).foregroundColor(.blue)
        }
        .sheet(isPresented: $showingSheet, onDismiss: {
            print("DisMissed")
        }, content: {
            PresentedView()
        })
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

struct PresentedView : View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented : Bool
    var body: some View {
        Button(action:{
            if self.presentationMode.wrappedValue.isPresented {
                self.presentationMode.wrappedValue.dismiss()
            }
        }){
            Text("Tap to Dismiss")
                .font(.title).foregroundColor(.red)
        }
    }
}
