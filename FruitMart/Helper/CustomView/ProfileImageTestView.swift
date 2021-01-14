//
//  ProfileImageTestView.swift
//  FruitMart
//
//  Created by twave on 2021/01/14.
//

import SwiftUI

struct ProfileImageTestView: View {
    var body: some View {

        VStack {
            HStack {
                ResizedImage("img_floating_office_m", contentMode: .fit)
                    .frame(width: 86, height: 86)

                Text("86 * 86").font(.largeTitle)
            }
            HStack {
                ResizedImage("img_floating_office_m", contentMode: .fit)
                    .frame(width: 42, height: 42)

                Text("42 * 42").font(.largeTitle)
            }
            HStack {
                ResizedImage("img_floating_office_m", contentMode: .fit)
                    .frame(width: 32, height: 32)

                Text("32 * 32").font(.largeTitle)
            }
            HStack {
                ResizedImage("img_floating_office_m", contentMode: .fit)
                    .frame(width: 20, height: 20)

                Text("20 * 20").font(.largeTitle)
            }
        }

    }
}

struct ProfileImageTestView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageTestView()
    }
}
