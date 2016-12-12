//
//  Extensions.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 10/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit
import Kingfisher

extension UIColor {
    
    convenience init(hex: String) {
        
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        if ((cString.characters.count) != 6) {
            print("wrong hex format")
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        let components = (
            R: CGFloat((rgbValue >> 16) & 0xff) / 255,
            G: CGFloat((rgbValue >> 08) & 0xff) / 255,
            B: CGFloat((rgbValue >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    class func mainGitHubSearchColor() -> UIColor {
        return UIColor(hex: "E9E8E9")
    }
}

extension UIImageView {
    
    public func imageFromUrl(_ urlString: String?) {
        
        self.kf.setImage(with: URL(string: urlString!))
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.black.cgColor
    }
}
