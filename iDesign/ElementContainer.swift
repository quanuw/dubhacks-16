//
//  ElementContainer.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import Foundation

class ElementContainer {
    
    var className: String
    var elements = Dictionary<String, UXElement>()
    
    init(className: String) {
        self.className = className
    }
    
    func add(element: UXElement) {
        if elements[element.name] != nil {
            // TODO: handle error
        }
        
        elements[element.name] = element
    }
    
    func generateSwiftCode() -> String {
        let result = NSMutableString()
        result.append("import UIKit\n\n")
        result.append("class ")
        result.append(className)
        result.append(": UIView {\n")
        
        // FIELDS
        for element in elements {
            result.append(element.value.generateSwiftCodeField())
        }
        
        // INITIALIZER
        result.append("\trequired init?(coder aDecoder: NSCoder) {\n")
        result.append("\t\tsuper.init(coder: aDecoder)\n")
        for element in elements {
            result.append(element.value.generateSwiftCodeInitializer())
        }
        result.append("\t}\n\n")
        
        // LAYOUT
        result.append("\toverride func layoutSubviews() {\n")
        result.append("\t\tsuper.layoutSubviews()\n")
        result.append("\t")
        for element in elements {
            result.append(element.value.generateSwiftCodeLayout())
        }
        result.append("\t}\n\n")
        
        result.append("}")
        return result as String
    }
}
