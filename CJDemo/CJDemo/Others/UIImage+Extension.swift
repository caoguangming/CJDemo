//
//  UIImage+Extension.swift
//  绿韵宝
//
//  Created by IMAC on 2018/11/28.
//  Copyright © 2018 LZY. All rights reserved.
//

import UIKit

extension UIImage {
    /// 根据颜色生成图片
    public convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        
        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        
        self.init(cgImage: aCgImage)
    }
    
}
