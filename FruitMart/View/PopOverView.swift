//
//  PopOverView.swift
//  FruitMart
//
//  Created by twave on 2021/01/11.
//

import SwiftUI

struct PopOverView: View {
    @State var showingPopover = false

    var body: some View {
        VStack {
            Button(action: {
                self.showingPopover.toggle()
                print("부모뷰 \(self.showingPopover)")
            }) {
                Text("Popover Button").font(.largeTitle)
            }
        }
        .popover(isPresented: $showingPopover, attachmentAnchor: .point(.topLeading), arrowEdge: .top, content: {
            popoverContents()
        })
    }


}

extension PopOverView {
    func popoverContents() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    print("값 바뀌기전 \(self.showingPopover)")
                    self.showingPopover = false
                    print("값 바뀐 후 \(self.showingPopover)")
                }) {
                    Text("Cancel").foregroundColor(.red)
                }
                Spacer()
                Text("New Event").font(.headline)
                Spacer()
                Button("Add(+)") { }
            }
            Divider().padding(.bottom, 8)
            Text("Title")
            TextField("제목", text: .constant(""))
            Text("contents")
            TextField("내용", text: .constant(""))
            Spacer()
        }
        .padding()
    }
}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView()
    }
}
