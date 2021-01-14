//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by twave on 2021/01/11.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store : Store
    let product : Product
    
    var body: some View {
//        Button(action: {
//            self.store.toggleFavorite(of: self.product)
//        }) {
//            Image(systemName: imageName)
//                .imageScale(.large)
//                .foregroundColor(.peach)
//                .frame(width:32, height: 32)
//                .onTapGesture {
//                    self.store.toggleFavorite(of: self.product)
//                }
        Symbol(imageName, imageScale: .large, color: .peach)
            .frame(width: 32, height: 32)
            .onTapGesture {
                self.store.toggleFavorite(of: self.product)
            }
        
//        }
    }
    
    private var imageName :String {
        product.isFavorite ? "heart.fill" : "heart"
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    
    static var previews: some View {
        FavoriteButton(product: productSamples[0])
    }
}
