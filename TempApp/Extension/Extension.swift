//
//  Extension.swift
//  GraphTest
//
//  Created by talgat on 14.01.18.
//  Copyright © 2018 Akezhan. All rights reserved.
//

import Foundation
import UIKit

//Methods for showing and hiding activity indicator

extension UIView{
    func showActivityIndicator() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let v = UIView(frame: window.frame)
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3668298856)
        v.tag = 18121995
        window.addSubview(v)
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 80))
        indicator.center = v.center
        indicator.startAnimating()
        v.addSubview(indicator)
    }
    
    func hideActivityIndicator() {
        guard let window = UIApplication.shared.keyWindow else { return }
        window.viewWithTag(18121995)?.removeFromSuperview()
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension UIViewController {
    func showActivityIndicator() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let v = UIView(frame: window.frame)
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3668298856)
        v.tag = 18121995
        window.addSubview(v)
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 80))
        indicator.center = v.center
        indicator.startAnimating()
        v.addSubview(indicator)
    }
    
    func hideActivityIndicator() {
        guard let window = UIApplication.shared.keyWindow else { return }
        window.viewWithTag(18121995)?.removeFromSuperview()
    }
    
}
