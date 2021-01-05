//
//  Home.swift
//  FruitMart
//
//  Created by yoon on 2021/01/03.
//

import SwiftUI

struct Home: View {
    let store : Store
    
    var body: some View {
//        NavigationView {
             
//            VStack {
//                ProductRow(product: productSamples[0])
//                ProductRow(product: productSamples[1])
//                ProductRow(product: productSamples[2])
//            }
        List(store.products, id:\.name) { product in
            ProductRow(product: product)
        }
//        }


    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: Store())
    }
}

