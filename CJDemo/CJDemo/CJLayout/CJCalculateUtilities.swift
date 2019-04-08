//
//  CJCalculateUtilities.swift
//  CJDemo
//
//  Created by 百年中堂 on 2019/4/8.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

final class CJCalculateUtilities {
    /// 计算文字的尺寸
    public class func textSize(text: String?, width: CGFloat? = nil, height: CGFloat? = nil, font: CGFloat, attributes: [NSAttributedString.Key : Any]? = nil) -> CGSize {
        guard let text = text else {
            return CGSize.zero
        }

        let size = text.boundingRect(with: CGSize(width: width ?? CGFloat.greatestFiniteMagnitude, height: height ?? CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attributes ?? [NSAttributedString.Key.font : UIFont.systemFont(ofSize: font)], context: nil).size
        return CGSize(width: width ?? size.width, height: height ?? size.height)
    }
}
