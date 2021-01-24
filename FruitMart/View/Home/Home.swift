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
    @State var product: Product?
    @State var quickOrder: Product?
    @State private var showingFavoriteImage: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                if showFavorite {
                    favoriteProducts
                }
                darkerDivider
                productList
            }
                .navigationBarTitle("과일마트")
                .onAppear {
                print("onAppear")
            }
                .onDisappear {
                print("onDisappear")
            }


        }
            .popup(item: $quickOrder, content: popupMessage(product:))


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
                .font(.title).bold().kerning(3)
                .foregroundColor(.black)
                .padding()

            OrderCompletedMessage()
        }
    }

    var favoriteProducts: some View {
        FavoriteProductScrollView(showingImage: $showingFavoriteImage)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }

    var darkerDivider: some View {
        Color.primary
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: 1)
    }

    var productList: some View {
        List(store.products) { product in
            NavigationLink(
                destination: ProductDetailView(product: product)) {
                ProductRow(quickOrder: self.$quickOrder, product: product)
            }
        }
    }

    var showFavorite: Bool {
        !store.products.filter { $0.isFavorite }.isEmpty
    }
}

