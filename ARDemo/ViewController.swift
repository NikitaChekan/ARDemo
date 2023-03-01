//
//  ViewController.swift
//  ARDemo
//
//  Created by Nikita Chekan on 28.02.2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        createFigures(in: scene)
//        createDimonRofl(in: scene)
        
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
        private func createFigures(in scene: SCNScene) {
            let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
            var xCoordinate: Double = 1
            sceneView.autoenablesDefaultLighting = true
    
            for geometryShape in array {
                let node = SCNNode(geometry: geometryShape)
                let material = SCNMaterial()
                material.diffuse.contents = UIColor.red
    
                node.geometry?.materials = [material]
                node.scale = SCNVector3(0.1, 0.1, 0.1)
    
                node.position = SCNVector3(xCoordinate, 0, -1.5)
                xCoordinate -= 0.2
    
                scene.rootNode.addChildNode(node)
            }
    
        }
    
    private func createDimonRofl(in scene: SCNScene) {
        
        // Создаем сферу и натягиваем на нее изображение
        let sphereGeometry = SCNSphere(radius: 0.1)
        let sphereMaterial = SCNMaterial()

        sphereMaterial.diffuse.contents = UIImage(named: "dima.jpg")
//        sphereMaterial.diffuse.contentsTransform = SCNMatrix4MakeScale(2, 2, 2) // размер текстуры
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.scale = SCNVector3(2.0, 2.0, 2.0)
        sphereNode.geometry?.materials = [sphereMaterial]
        sphereNode.position = SCNVector3(0, 0, -1)
        sphereNode.rotation = SCNVector4(x: 0, y: 1, z: 0, w: 3.14)

        scene.rootNode.addChildNode(sphereNode)
        
        //Текст
        let textGeometry = SCNText(string: "eblya", extrusionDepth: 2.0)
        let textMaterial = SCNMaterial()
        textMaterial.diffuse.contents = UIColor.red
        
        let textNode = SCNNode(geometry: textGeometry)
        textNode.scale = SCNVector3(0.005, 0.005, 0.005)
        textNode.geometry?.materials = [textMaterial]
        
        textNode.position = SCNVector3(0, 0.2, -1.5)
        textNode.rotation = SCNVector4(x: 0, y: 1, z: 0, w: 3.14 / 2)
        scene.rootNode.addChildNode(textNode)
        
        
        // баба
        let sphereTwoGeometry = SCNSphere(radius: 0.1)
        let sphereTwoMaterial = SCNMaterial()

        sphereTwoMaterial.diffuse.contents = UIImage(named: "head.jpg")
//        sphereMaterial.diffuse.contentsTransform = SCNMatrix4MakeScale(2, 2, 2) // размер текстуры
        let sphereTwoNode = SCNNode(geometry: sphereTwoGeometry)
        sphereTwoNode.scale = SCNVector3(2.0, 2.0, 2.0)
        sphereTwoNode.geometry?.materials = [sphereTwoMaterial]
        sphereTwoNode.position = SCNVector3(0, 0, -2)
        
        scene.rootNode.addChildNode(sphereTwoNode)
    }

}
