//
//  CommonExtensions.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
    func addTransparentBlackLayer(with opacity: Float) {
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        layer.opacity = opacity
        layer.masksToBounds = false
        layer.frame = self.bounds
        self.layer.addSublayer(layer)
    }
    
    func bounce(scale: CGFloat) {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        }) { (bool) in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            })
        }
    }
    func addShadowAndRoundCorner(cornerRadius : CGFloat = 6) {
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
    }
}
extension Date {
    func calenderDayDifference(from now: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: now)
        return calendar.dateComponents([.day], from: date1, to: date2).day!
    }
}
