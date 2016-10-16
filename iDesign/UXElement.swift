//
//  UXElement.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class UXElement {
    let name: String
    let className: String
    let canvasView: UIView
    var initializers = Dictionary<String, String>()
    var layouts = Dictionary<String, String>()
    
    init(name: String, className: String, view: UIView) {
        self.name = name
        self.className = className
        self.canvasView = view
    }
    
    func generateSwiftCodeField() -> String {
        let result = NSMutableString()
        
        result.append("\tvar ")
        result.append(name)
        result.append(" = ")
        result.append(className)
        result.append("()\n")
        
        return result as String
    }
    
    func generateSwiftCodeInitializer() -> String {
        let result = NSMutableString()
        result.append("\t\taddSubview(")
        result.append(name)
        result.append(")\n")
        
        return result as String
    }
    
    func generateSwiftCodeLayout() -> String {
        let screen: CGRect = UIScreen.main.bounds
        
        let width = canvasView.frame.width / screen.width
        let height = canvasView.frame.height / screen.height
        let originX = canvasView.frame.origin.x / screen.width
        let originY = canvasView.frame.origin.y / screen.height
        
        let result = NSMutableString()
        
        result.append("\t\t")
        result.append(name)
        result.append(".frame = CGRect(x: ")
        result.append(String(describing: originX))
        result.append(" * self.frame.width, y: ")
        result.append(String(describing: originY))
        result.append(" * self.frame.height, width: ")
        result.append(String(describing: width))
        result.append(" * self.frame.width, height: ")
        result.append(String(describing: height))
        result.append(" * self.frame.height)\n")
        
        return result as String
    }
}
