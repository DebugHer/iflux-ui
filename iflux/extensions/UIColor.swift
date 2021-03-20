//
//  UIColor.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIColor Extension

extension UIColor {
    /**
     Get RGB value and convert values into color.
     
     - parameter redValue:   CGFloat of red color
     - parameter greenValue: CGFloat of green color
     - parameter blueValue:  CGFloat of blue color
     - parameter alpha:      CGFloat of alpha
     
     - returns: UIColor from RGB
     */
    class func colorWithRedValue(_ redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255, alpha: alpha)
    }
    
    /**
     Get RGB value and convert values into color.
     
     - parameter rgbValue: UInt value of RGB
     - parameter alpha:    CGFloat of alpha
     
     - returns: UIColor from RGB
     */
    class func colorWithRGB(_ rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0xFF) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     Get hexa value of color with alpha value of 1
     Convert hexa value into RGB and get color.
     
     - parameter hexColorCode: String of hexa code
     
     - returns: UIColor from hexa color
     */
    convenience init(hexColorCode: String, alpha: CGFloat = 1.0) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = alpha
        
        if hexColorCode.hasPrefix("#") {
            let start = hexColorCode.index(hexColorCode.startIndex, offsetBy: 1)
            let hex = String(hexColorCode[start...])
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            
            if scanner.scanHexInt64(&hexValue) {
                if hex.count == 6 {
                    red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                    blue = CGFloat(hexValue & 0x0000FF) / 255.0
                } else if hex.count == 8 {
                    red = CGFloat((hexValue & 0xFF00_0000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF_0000) >> 16) / 255.0
                    blue = CGFloat((hexValue & 0x0000_FF00) >> 8) / 255.0
                    alpha = CGFloat(hexValue & 0x0000_00FF) / 255.0
                } else {
                    print("invalid hex code string, length should be 7 or 9", terminator: "")
                }
            } else {
                print("scan hex error")
            }
        } else {
            print("invalid hex code string, missing '#' as prefix", terminator: "")
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class func hexStringToUIColor(_ hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static let lightGray = UIColor.colorWithRedValue(235, greenValue: 235, blueValue: 235, alpha: 1.0)
    static let pinkColor = UIColor.colorWithRedValue(234, greenValue: 81, blueValue: 146, alpha: 1.0)
}
