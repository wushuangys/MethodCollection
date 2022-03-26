//
//  PassEventsViewController.swift
//  MethodCollection
//
//  Created by 无双 on 2022/3/26.
//

import UIKit

class PassEventsViewController: UIViewController {
    lazy var blueLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        layer.backgroundColor = UIColor.blue.cgColor
        return layer
    }()
    
    lazy var redView: RedBackView = {
        let view = RedBackView()
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        view.backgroundColor = .red
        return view
    }()

    lazy var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.frame = CGRect(x: -20, y: 180, width: 40, height: 40)
        return view
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.frame = CGRect(x: 180, y: 180, width: 40, height: 40)
        btn.addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "事件传递"
        view.backgroundColor = .white
        
        layerEvents()
    }
    
    @objc func clickBtn(sender: UIButton) {
        NSLog(" click btn ")
    }
        
    //MARK: --- 事件 ---
    func layerEvents() {
        view.addSubview(redView)
        redView.layer.addSublayer(blueLayer)
        
        redView.addSubview(purpleView)
        redView.addSubview(button)
    }
}

extension PassEventsViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 获取相对于主视图的触摸位置
        let point = ((touches as NSSet).anyObject() as AnyObject).location(in: self.view)
        // 获取触摸layer
        let layer = redView.layer.hitTest(point)
        
        if layer == redView.layer {
            NSLog(" 红色区域🌹🌹🌹 ")
        } else if layer == blueLayer {
            NSLog(" 蓝色区域🫐🫐🫐 ")
        } else if layer == purpleView.layer {
            NSLog(" 紫色区域🍇🍇🍇 ")
        }
    }
}
