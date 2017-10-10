//
//  SettingView.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 2017/9/25.
//  Copyright © 2017年 ZhangJun. All rights reserved.
//

import UIKit

class SettingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    var width :CGFloat!
    var height :CGFloat!
    var x :CGFloat!
    var y :CGFloat!
    
    required init?(coder aDecoder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setUI()
    }
    
    func setUI(){
        width = self.bounds.width - 50
        height = self.bounds.height
        x = 0
        y = 0
        
    }

}
