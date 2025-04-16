//
//  SheetView.swift
//  RealityKitDemo
//
//  Created by 歐東 on 4/4/25.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented: Bool
    @State var modelName: String = "Venus_Flytrap"
    
    var body: some View {
        ZStack(alignment: .topTrailing) {

            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)

            Button() {
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(24)
        }
    }
}

#Preview {
    SheetView(isPresented: .constant(true))
}
