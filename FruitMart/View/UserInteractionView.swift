//
//  UserInteractionView.swift
//  FruitMart
//
//  Created by twave on 2021/01/08.
//

import SwiftUI


class User: ObservableObject {
    let name = "User name"
    @Published var score = 0
}

class Payment : ObservableObject, Codable {
    var name  = ""
    
}


struct UserInteractionView: View {
    @State private var isFavorite = true
    @State private var count = 0
    @ObservedObject var user: User

    var body: some View {
//        stateBindingView
        observableView
    }
    
    var observableView : some View {
        VStack(spacing : 30) {
            Text(user.name)
            
            Button(action: {
                self.user.score += 1
            }) {
                Text(user.score.description)
            }
        }
    }

    var stateBindingView: some View {
        VStack(spacing: 30) {
            Toggle(isOn: $isFavorite) {
                Text("isFavorite : \(isFavorite.description)")
            }
            Stepper("Count : \(count)", value: $count)
        }
    }
}

struct UserInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        UserInteractionView(user: User())
    }
}
