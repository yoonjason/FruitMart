//
//  Preview.swift
//  FruitMart
//
//  Created by twave on 2021/01/07.
//

import SwiftUI

struct Preview<V : View>: View {
    
    enum Device : String, CaseIterable {
        case iPhone8 = "iPhone 8"
        case iPhone12 = "iPhone 12"
        case iPhone12Pro = "iPhone 12 Pro"
        case iPhone12ProMax = "iPhone 12 Pro Max"
    }
    
    let source : V
    var devices : [Device] = [.iPhone12Pro, .iPhone12ProMax, .iPhone8]
    var displayDarkMode : Bool = true
    
    var body: some View {
        Group {
            ForEach(devices, id:\.self) {
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0]).preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device : Device) -> some View {
        source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName(device.rawValue)
    }
    
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Text("Hello, SwiftUI"))
    }
}
