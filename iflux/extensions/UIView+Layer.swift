//
//  UIView+Layer.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation
import UIKit

private var characterSpaceKey: UInt8 = 0

@IBDesignable
extension UIView {
    
    @IBInspectable var maskToBounds:Bool  {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var characterSpace: CGFloat {
        get {
            if let space = objc_getAssociatedObject(self, &characterSpaceKey) as? CGFloat {
                return space
            } else {
                return 0
            }
        }
        
        set {
            objc_setAssociatedObject(self, &characterSpaceKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
