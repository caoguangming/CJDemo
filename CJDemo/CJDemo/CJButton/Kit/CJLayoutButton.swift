//
//  CJButton.swift
//  CJButtonDemo
//
//  Created by 百年中堂 on 2019/4/2.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

enum CJButtonLayoutStyle {
    case CJButtonLayoutImageLeft
    case CJButtonLayoutImageRight
    case CJButtonLayoutImageTop
    case CJButtonLayoutImageBottom
}

class CJLayoutButton: UIButton {
    // 图片文字间距
    var interTitleImageSpacing: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    // 图片和文字的相对位置
    var imagePosition: CJButtonLayoutStyle = .CJButtonLayoutImageLeft {
        didSet {
            setNeedsLayout()
        }
    }
    // 图片圆角半径
    var imageCornerRadius: CGFloat = 0 {
        didSet {
            imageView?.layer.cornerRadius = imageCornerRadius
            imageView?.layer.masksToBounds = true
        }
    }
    
    // 是否显示圆形图片
    var isRadiusImage: Bool = false {
        didSet {
            if isRadiusImage {
                if let imageView = imageView {
                    self.imageView?.layer.cornerRadius = imageView.frame.width / 2
                    self.imageView?.layer.masksToBounds = true
                }
            }
        }
    }
    
    // 设置图片大小
    var imageSize: CGSize? = nil {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CJLayoutButton {
    private func setup() {
        interTitleImageSpacing = 4
        imagePosition = .CJButtonLayoutImageLeft
        imageCornerRadius = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.bounds.isEmpty {
            return
        }
        
        resizeSubviews()
        switch imagePosition {
        case .CJButtonLayoutImageLeft:
            layoutSubviewsForImagePositionLeft()
        case .CJButtonLayoutImageRight:
            layoutSubviewsForImagePositionRight()
        case .CJButtonLayoutImageTop:
            layoutSubviewsForImagePositionTop()
        case .CJButtonLayoutImageBottom:
            layoutSubviewsForImagePositonBottom()
        }
        
    }
    
    private func resizeSubviews() {
        if imageSize == nil {
            if let image = self.imageView?.image {
                self.imageView?.frame.size = image.size
            }
        } else {
            self.imageView?.frame.size = imageSize!
        }
        
        
        
        self.titleLabel?.sizeToFit()
        
        if self.imagePosition == .CJButtonLayoutImageRight || self.imagePosition == .CJButtonLayoutImageLeft {
            if let labelWidth = self.titleLabel?.frame.width, let imageViewWidth = self.imageView?.frame.width {
                if labelWidth > self.frame.width - interTitleImageSpacing - imageViewWidth {
                    self.titleLabel?.frame.size.width = self.frame.width
                }
            }
        } else if self.imagePosition == .CJButtonLayoutImageTop || self.imagePosition == .CJButtonLayoutImageBottom {
            if let labelWidth = self.titleLabel?.frame.width {
                if labelWidth > self.frame.width {
                    self.titleLabel?.frame.size.width = self.frame.width
                }
            }
        }
    }
    
    private func layoutSubviewsForImagePositionLeft() {
        if self.contentHorizontalAlignment == .right {
            if let label = titleLabel, let imageView = imageView {
                self.titleLabel?.frame.origin.x = self.frame.width - label.frame.width
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
                self.imageView?.frame.origin.x = self.frame.width - label.frame.width - interTitleImageSpacing - imageView.frame.width
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
            }
        } else if self.contentHorizontalAlignment == .left {
            
            if let label = titleLabel, let imageView = imageView {
                self.imageView?.frame.origin.x = 0
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
                self.titleLabel?.frame.origin.x = imageView.frame.origin.x + imageView.frame.width + interTitleImageSpacing
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
            }
        } else if self.contentHorizontalAlignment == .center {
            if let label = titleLabel, let imageView = imageView {
                self.imageView?.frame.origin.x = self.frame.width * 0.5 - (label.frame.width + interTitleImageSpacing + imageView.frame.width) * 0.5
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
                self.titleLabel?.frame.origin.x = interTitleImageSpacing + (imageView.frame.origin.x + imageView.frame.width)
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
            }
        }
    }
    
    private func layoutSubviewsForImagePositionRight() {
        if let label = self.titleLabel, let imageView = self.imageView {
            if self.contentHorizontalAlignment == .right {
                self.imageView?.frame.origin.x = self.frame.width - imageView.frame.width
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
                self.titleLabel?.frame.origin.x = self.frame.width - imageView.frame.width - interTitleImageSpacing - label.frame.width
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
            } else if self.contentHorizontalAlignment == .left {
                self.titleLabel?.frame.origin.x = 0
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
                self.imageView?.frame.origin.x = interTitleImageSpacing + label.frame.width
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
            } else if self.contentHorizontalAlignment == .center {
                self.titleLabel?.frame.origin.x = self.frame.width * 0.5 - (label.frame.width + interTitleImageSpacing + imageView.frame.width) * 0.5
                self.titleLabel?.frame.origin.y = (self.frame.height - label.frame.height) * 0.5
                self.imageView?.frame.origin.x = label.frame.origin.x + label.frame.width + interTitleImageSpacing
                self.imageView?.frame.origin.y = (self.frame.height - imageView.frame.height) * 0.5
            }
        }
    }
    
    private func layoutSubviewsForImagePositionTop() {
        if let label = self.titleLabel, let imageView = self.imageView {
            if self.contentVerticalAlignment == .top {
                self.imageView?.frame.origin.y = 0
                self.imageView?.center.x = self.frame.width * 0.5
                self.titleLabel?.frame.origin.y = imageView.frame.origin.y + imageView.frame.height + interTitleImageSpacing
                self.titleLabel?.center.x = self.frame.width * 0.5
            } else if self.contentVerticalAlignment == .bottom {
                self.titleLabel?.frame.origin.y = self.frame.height - label.frame.height
                self.titleLabel?.center.x = self.frame.width * 0.5
                self.imageView?.frame.origin.y = self.frame.height - (imageView.frame.height + label.frame.height + interTitleImageSpacing)
                self.imageView?.center.x = self.frame.width * 0.5
            } else if self.contentVerticalAlignment == .center {
                self.imageView?.frame.origin.y = self.frame.height * 0.5 - (imageView.frame.height + label.frame.height + interTitleImageSpacing) * 0.5
                self.imageView?.center.x = self.frame.width * 0.5
                self.titleLabel?.frame.origin.y = imageView.frame.origin.y + imageView.frame.height + interTitleImageSpacing
                self.titleLabel?.center.x = self.frame.width * 0.5
            }
        }
    }
    
    private func layoutSubviewsForImagePositonBottom() {
        if let label = self.titleLabel, let imageView = self.imageView {
<<<<<<< HEAD:CJDemo/CJDemo/CJButton/CJLayoutButton.swift
            print("cc")
            print(label)
=======
>>>>>>> master:CJDemo/CJDemo/CJButton/Kit/CJLayoutButton.swift
            if self.contentVerticalAlignment == .top {
                self.titleLabel?.frame.origin.y = 0
                self.titleLabel?.center.x = self.frame.width * 0.5
                self.imageView?.frame.origin.y = label.frame.origin.y + label.frame.height + interTitleImageSpacing
                self.imageView?.center.x = self.frame.width * 0.5
            } else if self.contentVerticalAlignment == .bottom {
                self.imageView?.frame.origin.y = self.frame.height - imageView.frame.height
                self.imageView?.center.x = self.frame.width * 0.5
                self.titleLabel?.frame.origin.y = self.frame.height - (label.frame.height + interTitleImageSpacing + imageView.frame.height)
                self.titleLabel?.center.x = self.frame.width * 0.5
            } else if self.contentVerticalAlignment == .center {
                self.titleLabel?.frame.origin.y = self.frame.height * 0.5 - (imageView.frame.height + label.frame.height + interTitleImageSpacing) * 0.5
                self.titleLabel?.center.x = self.frame.width * 0.5
                self.imageView?.frame.origin.y = label.frame.origin.y + label.frame.height + interTitleImageSpacing
                self.imageView?.center.x = self.frame.width * 0.5
            }
        }
    }
}
