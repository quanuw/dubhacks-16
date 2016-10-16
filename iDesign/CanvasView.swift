//
//  CanvasView.swift
//  iDesign
//
//  Created by Kennan Mell on 10/15/16.
//  Copyright © 2016 Kennan Mell. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let dragView = UIView()
    let shareButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(dragView)
        dragView.backgroundColor = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        addSubview(shareButton)
        shareButton.setImage(UIImage(named: "ShareButton"), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dragView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        shareButton.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
    }
}
