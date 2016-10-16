//
//  CanvasController.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class CanvasController: UIViewController {
    
    var canvasView: CanvasView {
        return self.view as! CanvasView
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.dragView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.panDragView)))
        
        canvasView.dragView.leftTopCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.resizeDragView)))
        
        canvasView.dragView.rightTopCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.resizeDragView)))
        
        canvasView.dragView.leftBottomCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.resizeDragView)))
        
        canvasView.dragView.rightBottomCircle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasController.resizeDragView)))
        
    }
    
    @objc func panDragView(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        canvasView.dragView.leftTopCircle.center = CGPoint(x: canvasView.dragView.leftTopCircle.center.x + translation.x, y: canvasView.dragView.leftBottomCircle.center.y + translation.y)
        
    }
    
    func resizeDragView(sender: UIPanGestureRecognizer) {
        sender.view!.frame = CGRect(x: (sender.view! as! ResizeCircle).elementView.frame.origin.x, y: (sender.view! as! ResizeCircle).frame.origin.y, width: (sender.view! as! ResizeCircle).frame.width + sender.translation(in: self.view).x, height: (sender.view! as! ResizeCircle).frame.height + sender.translation(in:self.view).y)
    }
    
}

