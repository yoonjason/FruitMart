//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by twave on 2021/01/11.
//

import SwiftUI



struct QuantitySelector: View {
    @Binding var quantity : Int
    var range : ClosedRange<Int> = 1...20
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        HStack {
            Button(action: {
                self.changeQuantity(-1)
//                print(quantity)
                
            }) {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth:40, maxWidth: 60)
            
            Button(action: {self.changeQuantity(+1)}) {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
        }
        
    }
    
    private func changeQuantity(_ num : Int) {
        if range ~= quantity + num {
            print(quantity, num)
            quantity += num
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        }else {
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuantitySelector(quantity: .constant(0))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
