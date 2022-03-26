//
//  RedBackView.swift
//  MethodCollection
//
//  Created by 无双 on 2022/3/26.
//

import UIKit

class RedBackView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /*
        let view = super.hitTest(point, with: event)
        let coverPoint = self.button.convert(point, from: self)
        
        if self.button.point(inside: coverPoint, with: event) {
            return self.button
        }
        return view
        */
        
        
        if self.isUserInteractionEnabled == false || self.alpha < 0.05 || self.isHidden == true {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            // touch 的point 在 self 的 bounds 内
            for subview in self.subviews {
                // 进行坐标转化
                let coverPoint = subview.convert(point, from: self)

                // 调用子视图的 hitTest 重复上面的步骤。找到了，返回hitTest view ,没找到返回有自身处理
                let hitTestView = subview.hitTest(coverPoint, with: event)

                if hitTestView != nil {
                    return hitTestView
                }
            }
        } else {
            // 超出父视图
            for case let btn as UIButton in self.subviews {
                let coverPoint = btn.convert(point, from: self)
                
                if btn.point(inside: coverPoint, with: event) {
                    return btn
                }
            }
        }
        
        return nil
    }
    
     
     
}
