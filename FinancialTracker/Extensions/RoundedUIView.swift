//
//  RoundedUIView.swift
//  FinancialTracker
//
//  Created by Admin on 21.09.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class RoundedUIView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
