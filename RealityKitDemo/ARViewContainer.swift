//
//  ARViewContainer.swift
//  RealityKitDemo
//
//  Created by 歐東 on 4/4/25.
//


import SwiftUI
import RealityKit
import ARKit


struct ARViewContainer : UIViewRepresentable {
    @Binding var modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal,.vertical]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        
        uiView.scene.anchors.removeAll()
        
        let anchorEntity = AnchorEntity(plane: .any)
        
        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
        
        switch modelName {
            case "test":
                modelEntity.scale = SIMD3<Float>(0.1, 0.1, 0.1)  // 10% size
            case "Venus_Flytrap":
                print("VF")

                addGreenDotToModel(modelEntity)

            default:
                print("default")
                modelEntity.scale = SIMD3<Float>(1, 1, 1)  // keep the same size
        }

        anchorEntity.addChild(modelEntity)
        uiView.scene.addAnchor(anchorEntity)
    }
}

func addGreenDotToModel(_ modelEntity: Entity) {
    let sphere = MeshResource.generateSphere(radius: 0.02)
    let glowingMaterial = UnlitMaterial(color: .green)
    let dotEntity = ModelEntity(mesh: sphere, materials: [glowingMaterial])

    dotEntity.position = SIMD3<Float>(0.01, 0.13, 0)

    dotEntity.scale = SIMD3<Float>(0.1, 0.1, 0.1)

    modelEntity.addChild(dotEntity)
    print("✅ Added green dot to model")
}
