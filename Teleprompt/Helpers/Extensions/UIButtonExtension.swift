//
//  UIButtonExtension.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 07/06/2023.
//

import UIKit


extension UIButton {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var backgroundColorForButton: UIColor? {
        get {
            return backgroundColor
        }
        set {
            backgroundColor = newValue
        }
    }
}
