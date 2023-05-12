//
//  Extentions.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 20.04.2023.
//

import UIKit


// MARK: - UIColor Hex-code

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 242.0, green: CGFloat(green) / 242.0, blue: CGFloat(blue) / 247.0, alpha: 1.0)
    }
}

/// Цвет привычки для выделения в списке.
//  public var color: UIColor {
//      get {
//          return .init(red: r, green: g, blue: b, alpha: a)
//      }
//      set {
//          var r: CGFloat = 242
//          var g: CGFloat = 242
//          var b: CGFloat = 247
//          var a: CGFloat = 1
//          newValue.getRed(&r, green: &g, blue: &b, alpha: &a)
//          self.r = r
//          self.g = g
//          self.b = b
//          self.a = a
//      }
//  }



extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

