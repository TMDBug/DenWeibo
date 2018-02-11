//
//  UIButton+Extension.swift
//  DenWeibo
//
//  Created by DengXiangfei on 2018/1/24.
//  Copyright © 2018年 DengXiangfei. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(imageName: String, backImageName: String?) {
        self.init()
        // 图
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        // 背景图
        setBackgroundImage(UIImage(named: backImageName!), for: .normal)
        setBackgroundImage(UIImage(named: backImageName! + "_highlighted"), for: .highlighted)
        // 根据图片大小调整尺寸
        sizeToFit()
    }
    
    
}
