//
//  Home.swift
//  FruitMart
//
//  Created by yoon on 2021/01/03.
//

import SwiftUI

struct Home: View {
//    let store: Store
    @EnvironmentObject private var store: Store
    @State private var quickOrder: Product?


    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink(
                    destination: ProductDetailView(product: product)) {
                    ProductRow(quickOrder: .constant(nil), product: product)
                }
            }
                .navigationBarTitle("과일마트")
                .onAppear {
                print("onAppear")
            }
                .onDisappear {
                print("onDisappear")
            }
        }
        .popOverContext(item: $quickOrder, style: .blur, content: popupMessage(product: ))
//            .popup(item: $quickOrder, content: popupMessage(product:))
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        Home(store: Store())
//        Preview(source: Home(store: Store()))
        Preview(source: Home())
            .environmentObject(Store())
    }
}

extension Home {
    class ViewModel: ObservableObject {
        @Published private var products: [Product] = []


    }

    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last!
        return VStack {
            Text(name)
                .font(.largeTitle)
                .foregroundColor(.peach)
                .padding()

            OrderCompletedMessage()
        }
    }

}

