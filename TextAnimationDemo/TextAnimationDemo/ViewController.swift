//
//  ViewController.swift
//  TextAnimationDemo
//
//  Created by yidahis on 2019/12/12.
//  Copyright © 2019 fame.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
            self.helloLabel.animate(font: UIFont.systemFont(ofSize: 80), duration: 2)
        }
    }
}

extension UILabel {
    //解决Label 做放大动画时导致模糊问题
    //如果标签文本左对齐或右对齐，则取消注释行
    func animate(font: UIFont, duration: TimeInterval) {
       //let oldFrame = frame
        let labelScale = self.font.pointSize/font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
       //let newOrigin = frame.origin
       //frame.origin = oldFrame.origin//only for left aligned text
       //frame.origin = CGPoint(x: oldFrame.origin.x + oldFrame.width - frame.width, y: oldFrame.origin.y)//only for right aligned text
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            //L self.frame.origin = newOrigin
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}

