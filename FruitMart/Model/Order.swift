//
//  Order.swift
//  FruitMart
//
//  Created by twave on 2021/01/11.
//

import Foundation

struct Order : Codable, Identifiable {
    
    /*
     sequence 함수를 이용해 초깃값은 1로 지정하고, 매번 다음번에 올 값은 이전 대비 1씩 증가한 값이
     되도록 구현
     Order에 대한 인스턴스를 생성할 때에는 이 값을 참고하여 id를 지정한다.
     앱을 다시 실행할 때마다 주문번호가 1로 초기화되므로, 번호를 계속 유지해야할 때는 초깃값을
     알맞게 조정해줘야한다.
     */
    static var orderSequence = sequence(first: 1) { $0 + 1}
    
    
    let id : Int
    let product : Product
    let quantity : Int
    
    var price : Int {
        product.price * quantity
    }
}
