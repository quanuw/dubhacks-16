//
//  CanvasView.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let dragView: ElementView
    
    required init?(coder aDecoder: NSCoder) {
        dragView = ElementView(coder: aDecoder)!
        super.init(coder: aDecoder)
        addSubview(dragView)
        dragView.backgroundColor = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        dragView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
    }
}


class ElementView: UIView {
    var leftTopCircle: ResizeCircle!
    var rightTopCircle: ResizeCircle!
    var leftBottomCircle: ResizeCircle!
    var rightBottomCircle: ResizeCircle!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        leftTopCircle = ResizeCircle(elementView: self)
        rightTopCircle = ResizeCircle(elementView: self)
        leftBottomCircle = ResizeCircle(elementView: self)
        rightBottomCircle = ResizeCircle(elementView: self)
        
        addSubview(leftTopCircle)
        addSubview(rightTopCircle)
        addSubview(leftBottomCircle)
        addSubview(rightBottomCircle)
        
        leftTopCircle.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        //        rightTopCircle.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        //        leftBottomCirle.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        //        rightBottomCircle.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        
    }
    
    /* test */
    func initGestureRecgnizer() {
        let pinchGR = UIPinchGestureRecognizer(target: self, action: Selector(("didPinch:")))
        addGestureRecognizer(pinchGR)
    }
    
    func didPinch(pinchGR: UIPinchGestureRecognizer) {
        self.superview!.bringSubview(toFront: self)
        
        let scale = pinchGR.scale
        
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        
        pinchGR.scale = 1.0
        
    }
    override func layoutSubviews() {
        let width = self.frame.width * 0.1
        let height = self.frame.height * 0.1
        leftTopCircle.frame = CGRect(x: self.frame.origin.x - width * 1.5, y: self.frame.origin.y , width: width, height: height)
    }
    
    
    
    
}

class ResizeCircle: UIView {
    var elementView: ElementView!
    
    init(elementView: ElementView) {
        self.elementView = elementView
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func draw(_ rect: CGRect) {
    //        let ovalBounds = self.bounds.insetBy(dx: 10, dy: 10)
    //        let oval = UIBezierPath(ovalIn: ovalBounds)
    //        let brightRed = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    //        brightRed.setFill()
    //        oval.fill()
    //    }
}
