//
//  UIViewExtension.swift
//  RTH
//
//  Created by Lan Thien on 11/22/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import UIKit

extension UIView {
    func makeBorder(color:UIColor, width:CGFloat, radius:CGFloat) {
        self.clipsToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
    }
    
    func makeShadow(color:UIColor, offset:CGSize, radius:CGFloat, opacity:Float) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    
    func captureImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
