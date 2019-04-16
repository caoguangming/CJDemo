//
//  UIView+extension.swift
//  asdfasfd
//
//  Created by 百年中堂 on 2019/4/4.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

extension UIView {
    var cj_layoutMargins: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return UIEdgeInsets(top: self.layoutMargins.top, left: self.layoutMargins.left - 16, bottom: self.layoutMargins.bottom, right: self.layoutMargins.right - 16)
        }
    }
    
    var cj_safe_topAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.layoutMarginsGuide.topAnchor
        }
    }
    
    var cj_safe_bottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.layoutMarginsGuide.bottomAnchor
        }
    }
    
    var cj_safe_heightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.heightAnchor
        } else {
            return self.layoutMarginsGuide.heightAnchor
        }
    }
    
    var cj_safe_leadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        } else {
            return self.layoutMarginsGuide.leadingAnchor
        }
    }

    var cj_safe_trailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        } else {
            return self.layoutMarginsGuide.trailingAnchor
        }
    }

    var cj_safe_leftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.layoutMarginsGuide.leftAnchor
        }
    }

    var cj_safe_rightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.layoutMarginsGuide.rightAnchor
        }
    }



    var cj_safe_widthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.widthAnchor
        } else {
            return self.layoutMarginsGuide.widthAnchor
        }
    }

    var cj_safe_centerXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        } else {
            return self.centerXAnchor
        }
    }

    var cj_safe_centerYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        } else {
            return self.centerYAnchor
        }
    }
    
}
