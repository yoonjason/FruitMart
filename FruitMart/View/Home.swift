//
//  Home.swift
//  FruitMart
//
//  Created by yoon on 2021/01/03.
//

import SwiftUI

struct Home: View {
    var body: some View {

        VStack {
            
            ProductRow(product: productSamples[0])
            ProductRow(product: productSamples[1])
            ProductRow(product: productSamples[2])
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

