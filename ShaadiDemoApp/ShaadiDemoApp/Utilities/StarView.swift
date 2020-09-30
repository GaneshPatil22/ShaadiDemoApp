//
//  StarView.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/29/20.
//

import UIKit

class StarView: UIView {

    let shapeLayer = CAShapeLayer()
    var path: UIBezierPath?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        createStar()
    }

    private func createStar() {
        path = UIBezierPath()
        let center = CGPoint(x: self.frame.width / 2.0, y: self.frame.height / 2.0)
        let xCenter: CGFloat = center.x
        let yCenter: CGFloat = center.y
        let w = self.frame.width
        let r = w / 2.0
        let flip: CGFloat = -1.0
        let polySide = CGFloat(5)
        let theta = 2.0 * Double.pi * Double(2.0 / polySide)
        path?.move(to: CGPoint(x: xCenter, y: r * flip + yCenter))
        for i in 1..<Int(polySide) {
            let x: CGFloat = r * CGFloat( sin(Double(i) * theta) )
            let y: CGFloat = r * CGFloat( cos(Double(i) * theta) )
            path?.addLine(to: CGPoint(x: x + xCenter, y: y * flip + yCenter))
        }
        path?.close()
        shapeLayer.path = path?.cgPath
        layer.addSublayer(shapeLayer)
    }

    func setColor(color: UIColor) {
        shapeLayer.fillColor = color.cgColor
    }
}
