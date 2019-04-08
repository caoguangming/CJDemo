//
//  CJLayout.swift
//  CJDemo
//
//  Created by 百年中堂 on 2019/4/4.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

final class CJLayout {
    static let widthScale = UIScreen.main.bounds.size.width / 375.0
    
    public class func value(px: CGFloat) -> CGFloat {
        return px / 2 * CJLayout.widthScale
    }
    
    public class func value(pt: CGFloat) -> CGFloat {
        return pt * CJLayout.widthScale
    }
    
    public class func font(px: CGFloat) -> CGFloat {
        return px / 2 * CJLayout.widthScale
    }
    
    public class func font(pt: CGFloat) -> CGFloat {
        return pt * CJLayout.widthScale
    }
}
