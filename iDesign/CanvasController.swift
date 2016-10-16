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
    }
    
    @objc func panDragView(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}

