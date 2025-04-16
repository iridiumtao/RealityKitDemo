//
//  ContentView.swift
//  RealityKitDemo
//
//  Created by 歐東 on 4/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {

            Button {
                isPresented.toggle()
                    } label: {
                        Label("View in AR", systemImage: "arkit")
                    }.buttonStyle(BorderedProminentButtonStyle())
                .padding(24)

        }
                .padding()
                
        .fullScreenCover(isPresented: $isPresented, content: {
           SheetView(isPresented: $isPresented)
        })
    }
}

#Preview {
    ContentView()
}
