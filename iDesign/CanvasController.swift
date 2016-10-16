//
//  CanvasController.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class CanvasController: UIViewController {
    
    var elementContainer: ElementContainer!
    var elementModel: UXElement!

    var canvasView: CanvasView {
        return self.view as! CanvasView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementModel = UXElement(name: "em", className: "UIView", view: canvasView.dragView)
        elementContainer = ElementContainer(className: "MyView")
        elementContainer.add(element: elementModel)
        canvasView.dragView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.panDragView)))
        canvasView.shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CanvasController.shareTapped)))
    }
    
    func panDragView(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func shareTapped() {
        // Set up and open Apple's default sharing feature.
        
        let objectsToShare: Array<NSObject> = [elementContainer.generateSwiftCode() as NSObject]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        let popoverView = UIView()
        if activityVC.responds(to: #selector(getter: UIViewController.popoverPresentationController)) {
            // TODO: iPad
        }
        
        self.present(activityVC, animated: true, completion: {
            popoverView.removeFromSuperview()
        })
    }

}

