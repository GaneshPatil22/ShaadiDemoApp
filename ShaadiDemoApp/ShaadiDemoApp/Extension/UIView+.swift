//
//  UIView+.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/30/20.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, view: UIView...) {
        var viewDict: [String: UIView] = [String: UIView]()
        for(index, view) in view.enumerated() {
            let key = "v\(index)"
            viewDict[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDict))
    }
}
