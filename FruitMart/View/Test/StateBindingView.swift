//
//  StateBindingView.swift
//  FruitMart
//
//  Created by twave on 2021/01/18.
//

import SwiftUI

class CountRepo : ObservableObject {
    @Published var count : Int = 0
    var count2 : Int = 0 {
        willSet(newVal) {
            print(newVal % 5)
            if newVal % 5 == 0 {
                objectWillChange.send()
            }
        }
    }
}

struct StateBindingView: View {
    @State var isToggleOn : Bool = true
    @State private var isShowingDetailView = false
    @ObservedObject var countRepo = CountRepo()
    
    var body: some View {
        NavigationView() {
            VStack {
                NavigationLink(
                    destination: Text("SecondView"),
                    isActive: $isShowingDetailView) {
                    EmptyView()
                }
                Button("Tap to show Detail") {
                    self.isShowingDetailView = true
                }
//                Toggle(isOn: $isToggleOn) {
//                    Text("글자를 가립니다.")
//                }
//                .padding()
                
                ChildView(isToggleOn: $isToggleOn)
                if isToggleOn {
                    Text("그으으을자!")
                }
                Text("\(self.countRepo.count)").font(.largeTitle)
                
                Button("숫자증가") {
                    print(countRepo.count)
                    
                    self.countRepo.count += 1
                }
            }
            .navigationBarTitle("실험실")
        }
    }
}

struct ChildView : View {
    @Binding var isToggleOn : Bool
    
    var body : some View {
        Toggle(isOn: $isToggleOn){
            Text("글자를 가립니다.")
        }.padding()
        
    }
}

struct StateBindingView_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingView()
    }
}
