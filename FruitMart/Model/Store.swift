//
//  Store.swift
//  FruitMart
//
//  Created by twave on 2021/01/05.
//

import Foundation

final class  Store : ObservableObject {
    @Published var products : [Product]
    @Published var orders : [Order] = []
    
    init(filename : String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
    
}


extension Store {
    func toggleFavorite(of product : Product) {
        guard let index = products.firstIndex(of: product) else { return }
        products[index].isFavorite.toggle()
    }
    
    func placeOrder(product : Product, quantity : Int) {
        let nextID = Order.orderSequence.next()!
        let order = Order(id: nextID, product: product, quantity: quantity)
        orders.append(order)
    }
}
