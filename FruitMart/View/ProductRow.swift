//
//  ProductRow.swift
//  FruitMart
//
//  Created by yoon on 2021/01/03.
//

import SwiftUI


struct ProductRow: View {
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }
        .frame(height:150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color:Color.primaryShadow, radius: 1, x: 2, y: 3)
        .padding(.vertical, 8)
    }
  
}


struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow()
    }
}

extension ProductRow {
    
    var productImage : some View {
        Image("apple")
            .resizable()
            .scaledToFill()
            .frame(width:140)
            .clipped()
    }
    
    var productDescription : some View {
        VStack(alignment:.leading){
            Text("백설공주 사과")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text("달콤한 맛이 좋은 과일의 여왕 사과, 독은 없고 꿀만 가득해요!!")
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    
    var footerView : some View {
        HStack(spacing:0) {
            Text("2100")
                .font(.headline)
                + Text("원")
                .font(.footnote)
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
        }
    }
}
