//
//  Store.swift
//  FruitMart
//
//  Created by twave on 2021/01/05.
//

import Foundation

final class  Store {
    var products : [Product]
    
    init(filename : String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
