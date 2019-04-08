//
//  NSLayoutConstraint+extension.swift
//  CJDemo
//
//  Created by 百年中堂 on 2019/4/8.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    
    public func startActive() {
        self.isActive = true
    }
    
    public func endActive() {
        self.isActive = false
    }
    
    public func updateConstraint(newConstraint: NSLayoutConstraint) {
        self.isActive = false
        newConstraint.isActive = true
    }
}
